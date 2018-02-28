module Kernel
  module_function

  # Instructs Web Console to render a console in the specified binding.
  #
  # If +binding+ isn't explicitly given it will default to the binding of the
  # previous frame. E.g. the one that invoked +console+.
  #
  # Raises DoubleRenderError if a double +console+ invocation per request is
  # detected.
  def console(binding = Bindex.current_bindings.second)
    raise WebConsole::DoubleRenderError if Thread.current[:__web_console_binding]

    Thread.current[:__web_console_binding] = binding

    # Make sure nothing is rendered from the view helper. Otherwise
    # you're gonna see unexpected #<Binding:0x007fee4302b078> in the
    # templates.
    nil
  end
end

module WebConsole
  module DebugExceptionsExt
    def render_exception(request, exception)
      super(request, exception).tap do
        backtrace_cleaner = request.get_header('action_dispatch.backtrace_cleaner')
        error = ActionDispatch::ExceptionWrapper.new(backtrace_cleaner, exception).exception

        # Get the original exception if ExceptionWrapper decides to follow it.
        Thread.current[:__web_console_exception] = error

        # ActionView::Template::Error bypass ExceptionWrapper original
        # exception following. The backtrace in the view is generated from
        # reaching out to original_exception in the view.
        if error.is_a?(ActionView::Template::Error)
          Thread.current[:__web_console_exception] = error.cause
        end
      end
    end
  end
end

ActionDispatch::DebugExceptions.prepend(WebConsole::DebugExceptionsExt)
