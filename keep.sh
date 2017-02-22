# Parts of Language Service
commons-atom
commons-node
hyperclick
nuclide-analytics
nuclide-busy-signal
nuclide-code-format
nuclide-code-highlight
nuclide-context-view
nuclide-datatip
nuclide-definition-hyperclick
nuclide-definition-service
nuclide-definition-service-common
nuclide-diagnostics-common
nuclide-diagnostics-datatip-provider
nuclide-diagnostics-provider-base
nuclide-diagnostics-store
nuclide-diagnostics-ui
nuclide-flow
nuclide-flow-common
nuclide-flow-rpc
nuclide-language-service
nuclide-language-service-rpc
nuclide-logging
nuclide-node-transpiler
nuclide-open-files
nuclide-open-files-rpc
nuclide-outline-view
nuclide-textedit
nuclide-type-coverage
nuclide-type-hint
nuclide-ui
nuclide-workspace-view-locations
nuclide-workspace-views

# Unrelated packages easier to pull in than to fix.
nuclide-debugger-interfaces
nuclide-test-helpers
pkg/nuclide-debugger-base
pkg/nuclide-home
pkg/nuclide-nux
pkg/nuclide-distraction-free-mode

# this leaves the following isses to resolve:

1) Add a local only shim for the nuclide-remote-connection package.

This includes:

setUseLocalRpc
  - no op
getServiceByNuclideUri, getServiceByConnection
  - for nuclide-flow-rpc and nuclide-open-files-rpc only.
ConnectionCache
  - special case for only a single local connection
ServerConnection
  - dummy empty type definition only


Related Errors:
lib/main.js:30
 30: import {setUseLocalRpc} from '../pkg/nuclide-remote-connection/lib/service-manager';
                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../pkg/nuclide-remote-connection/lib/service-manager. Required module not found

pkg/nuclide-flow/lib/FlowServiceFactory.js:23
 23: import {getServiceByNuclideUri, getServiceByConnection} from '../../nuclide-remote-connection';
                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../../nuclide-remote-connection. Required module not found
pkg/nuclide-flow/lib/main.js:23
 23: import {getServiceByNuclideUri} from '../../nuclide-remote-connection';
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../../nuclide-remote-connection. Required module not found
pkg/nuclide-language-service/lib/AtomLanguageService.js:26
 26: import {ConnectionCache} from '../../nuclide-remote-connection';
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../../nuclide-remote-connection. Required module not found

pkg/nuclide-open-files/lib/NotifiersByConnection.js:19
 19: } from '../../nuclide-remote-connection';
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../../nuclide-remote-connection. Required module not found

pkg/nuclide-open-files/lib/main.js:12
 12: import type {ServerConnection} from '../../nuclide-remote-connection';
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../../nuclide-remote-connection. Required module not found


2) Split the uses of this file in 2.
pkg/commons-atom/text-buffer.js:19
 19: import {ServerConnection, NuclideTextBuffer} from '../nuclide-remote-connection';
                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../nuclide-remote-connection. Required module not found

3) Move the imported def to a new file which can be referenced by the new distro.
pkg/nuclide-flow/lib/main.js:11
 11: import type {NuclideEvaluationExpressionProvider} from '../../nuclide-debugger-interfaces/service';
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ../../nuclide-debugger-interfaces/service. Required module not found
