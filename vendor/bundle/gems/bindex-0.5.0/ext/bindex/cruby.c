#include <ruby.h>
#include <ruby/debug.h>

VALUE bx_mBindex;
static ID id_bindings;

static VALUE
current_bindings_callback(const rb_debug_inspector_t *context, void *data)
{
  VALUE locations = rb_debug_inspector_backtrace_locations(context);
  VALUE binding, bindings = rb_ary_new();
  long i, length = RARRAY_LEN(locations);

  for (i = 0; i < length; i++) {
    binding = rb_debug_inspector_frame_binding_get(context, i);

    if (!NIL_P(binding)) {
      rb_ary_push(bindings, binding);
    }
  }

  return bindings;
}

VALUE
current_bindings(void)
{
  return rb_debug_inspector_open(current_bindings_callback, NULL);
}

static void
set_exception_bindings_callback(VALUE tpval, void *data)
{
  rb_trace_arg_t *trace_arg = rb_tracearg_from_tracepoint(tpval);
  VALUE exception = rb_tracearg_raised_exception(trace_arg);
  VALUE bindings = rb_attr_get(exception, id_bindings);

  /* Set the bindings, only if they haven't been set already. This may reset
   * the binding during reraise. */
  if (NIL_P(bindings)) {
    rb_ivar_set(exception, id_bindings, current_bindings());
  }
}

void
set_exception_bindings_on_raise(void)
{
  VALUE tpval = rb_tracepoint_new(0, RUBY_EVENT_RAISE, set_exception_bindings_callback, 0);
  rb_tracepoint_enable(tpval);
}

static VALUE
bx_current_bindings(VALUE self)
{
  return current_bindings();
}

static VALUE
bx_exc_bindings(VALUE self)
{
  VALUE bindings = rb_attr_get(self, id_bindings);

  if (NIL_P(bindings)) {
    bindings = rb_ary_new();
  }

  return bindings;
}

void
Init_cruby(void)
{
  bx_mBindex = rb_define_module("Bindex");
  id_bindings = rb_intern("bindings");

  rb_define_singleton_method(bx_mBindex, "current_bindings", bx_current_bindings, 0);
  rb_define_method(rb_eException, "bindings", bx_exc_bindings, 0);

  set_exception_bindings_on_raise();
}
