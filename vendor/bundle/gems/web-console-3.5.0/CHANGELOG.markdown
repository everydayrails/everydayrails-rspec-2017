# CHANGELOG

## master (unreleased)

## 3.5.0

* [237](https://github.com/rails/web-console/pull/237) Bindex integration for JRuby 9k support ([@gsamokovarov])
* [236](https://github.com/rails/web-console/pull/236) Remove unused Active Support lazy load hook ([@betesh])
* [230](https://github.com/rails/web-console/pull/230) Handle invalid remote addresses ([@akirakoyasu])

## 3.4.0

* [#205](https://github.com/rails/web-console/pull/205) Introduce autocompletion ([@sh19910711])

## 3.3.1

Drop support for Rails `4.2.0`.

## 3.3.0

* [203](https://github.com/rails/web-console/pull/203) Map bindings to traces based on the trace __FILE__ and __LINE__ ([@gsamokovarov])

## 3.2.1

* [#202](https://github.com/rails/web-console/pull/202) Use first binding when there is no application binding ([@sh19910711])

## 3.2.0

* [#198](https://github.com/rails/web-console/pull/198) Pick the first application trace binding on errors ([@sh19910711])
* [#189](https://github.com/rails/web-console/pull/189) Silence ActionView rendering information ([@gsamokovarov])

## 3.1.1

* [#185](https://github.com/rails/web-console/pull/185) Fix `rails console` startup ([@gsamokovarov])

## 3.1.0

* [#182](https://github.com/rails/web-console/pull/182) Let `#console` live in `Kernel` ([@schneems])
* [#181](https://github.com/rails/web-console/pull/181) Log internal Web Console errors ([@gsamokovarov])
* [#180](https://github.com/rails/web-console/pull/180) Autoload Web Console constants for faster Rails boot time ([@herminiotorres])

## 3.0.0

* [#173](https://github.com/rails/web-console/pull/173) Revert "Change config.development_only default until 4.2.4 is released" ([@gsamokovarov])
* [#171](https://github.com/rails/web-console/pull/171) Fixed blocked IP logging ([@gsamokovarov])
* [#162](https://github.com/rails/web-console/pull/162) Render the console inside the body tag ([@gsamokovarov])
* [#165](https://github.com/rails/web-console/pull/165) Revamped integrations for CRuby and Rubinius ([@gsamokovarov])

## 2.3.0

This is mainly a Rails 5 compatibility release. If you have the chance, please
go to 3.1.0 instead.

* [#181](https://github.com/rails/web-console/pull/181) Log internal Web Console errors (@schneems)
* [#150](https://github.com/rails/web-console/pull/150) Revert #150. (@gsamokovarov)

## 2.2.1

* [#150](https://github.com/rails/web-console/pull/150) Change config.development_only default until 4.2.4 is released ([@gsamokovarov])

## 2.2.0

* [#140](https://github.com/rails/web-console/pull/140) Add the ability to close the console on each page ([@sh19910711])
* [#135](https://github.com/rails/web-console/pull/135) Run the console only in development mode and raise warning in tests ([@frenesim])
* [#134](https://github.com/rails/web-conscle/pull/134) Force development only web console by default ([@gsamokovarov])
* [#123](https://github.com/rails/web-console/pull/123) Replace deprecated `alias_method_chain` with `alias_method` ([@jonatack])

## 2.1.3

* Fix remote code execution vulnerability in Web Console. CVE-2015-3224.

## 2.1.2

* [#115](https://github.com/rails/web-console/pull/115) Show proper binding when raising an error in a template ([@gsamokovarov])
* [#114](https://github.com/rails/web-console/pull/114) Fix templates non rendering, because of missing template suffix ([@gsamokovarov])

## 2.1.1

* [#112](https://github.com/rails/web-console/pull/112) Always allow application/x-www-form-urlencoded content type ([@gsamokovarov])

## 2.1.0

* [#109](https://github.com/rails/web-console/pull/109) Revamp unavailable session response message ([@gsamokovarov])
* [#107](https://github.com/rails/web-console/pull/107) Fix pasting regression for all browsers ([@parterburn])
* [#105](https://github.com/rails/web-console/pull/105) Lock scroll bottom on console window resize ([@noahpatterson])
* [#104](https://github.com/rails/web-console/pull/104) Always whitelist localhost and inform users why no console is displayed ([@gsamokovarov])
* [#100](https://github.com/rails/web-console/pull/100) Accept text/plain as acceptable content type for Puma ([@gsamokovarov])
* [#98](https://github.com/rails/web-console/pull/98) Add arbitrary big z-index to the console ([@bglbruno])
* [#88](https://github.com/rails/web-console/pull/88) Spelling fixes ([@jeffnv])
* [#86](https://github.com/rails/web-console/pull/86) Disable autofocus when initializing the console ([@ryandao])
* [#84](https://github.com/rails/web-console/pull/84) Allow Rails 5 as dependency in gemspec ([@jonatack])
* [#69](https://github.com/rails/web-console/pull/69) Introduce middleware for request dispatch and console rendering ([@gsamokovarov])

[@jonatack]: https://github.com/jonatack
[@ryandao]: https://github.com/ryandao
[@jeffnv]: https://github.com/jeffnv
[@gsamokovarov]: https://github.com/gsamokovarov
[@bglbruno]: https://github.com/bglbruno
[@noahpatterson]: https://github.com/noahpatterson
[@parterburn]: https://github.com/parterburn
[@sh19910711]: https://github.com/sh19910711
[@frenesim]: https://github.com/frenesim
[@herminiotorres]: https://github.com/herminiotorres
[@schneems]: https://github.com/schneems
[@betesh]: https://github.com/betesh
[@akirakoyasu]: https://github.com/akirakoyasu
