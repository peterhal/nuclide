# maybe
rm -rf pkg/nuclide-file-tree
rm -rf pkg/nuclide-notifications
rm -rf pkg/nuclide-settings

# strip
rm -rf pkg/nuclide-adb-logcat
rm -rf pkg/nuclide-adb-rpc
rm -rf pkg/nuclide-arcanist
rm -rf pkg/nuclide-arcanist-rpc
rm -rf pkg/nuclide-atom-notifications
rm -rf pkg/nuclide-atom-script
rm -rf pkg/nuclide-blame
rm -rf pkg/nuclide-blame-provider-hg
rm -rf pkg/nuclide-bookshelf
rm -rf pkg/nuclide-buck
rm -rf pkg/nuclide-buck-base
rm -rf pkg/nuclide-buck-ios
rm -rf pkg/nuclide-buck-rpc
rm -rf pkg/nuclide-clang
rm -rf pkg/nuclide-clang-rpc
rm -rf pkg/nuclide-clipboard-path
rm -rf pkg/nuclide-console
rm -rf pkg/nuclide-ctags
rm -rf pkg/nuclide-ctags-rpc
rm -rf pkg/nuclide-current-working-directory
rm -rf pkg/nuclide-debugger
rm -rf pkg/nuclide-debugger-base
rm -rf pkg/nuclide-debugger-common
rm -rf pkg/nuclide-debugger-iwdp
rm -rf pkg/nuclide-debugger-iwdp-rpc
rm -rf pkg/nuclide-debugger-native
rm -rf pkg/nuclide-debugger-native-rpc
rm -rf pkg/nuclide-debugger-node
rm -rf pkg/nuclide-debugger-node-rpc
rm -rf pkg/nuclide-debugger-php
rm -rf pkg/nuclide-debugger-php-rpc
rm -rf pkg/nuclide-debugger-python-rpc
rm -rf pkg/nuclide-deep-link
rm -rf pkg/nuclide-diff-view
rm -rf pkg/nuclide-file-watcher
rm -rf pkg/nuclide-filewatcher-rpc
rm -rf pkg/nuclide-fuzzy-file-search-rpc
rm -rf pkg/nuclide-fuzzy-filename-provider
rm -rf pkg/nuclide-fuzzy-native
rm -rf pkg/nuclide-graphql
rm -rf pkg/nuclide-graphql-language-service
rm -rf pkg/nuclide-graphql-rpc
rm -rf pkg/nuclide-grep-rpc
rm -rf pkg/nuclide-hack
rm -rf pkg/nuclide-hack-common
rm -rf pkg/nuclide-hack-rpc
rm -rf pkg/nuclide-health
rm -rf pkg/nuclide-hg-conflict-resolver
rm -rf pkg/nuclide-hg-repository
rm -rf pkg/nuclide-hg-repository-client
rm -rf pkg/nuclide-hg-rpc
rm -rf pkg/nuclide-hhvm
rm -rf pkg/nuclide-http-request-sender
rm -rf pkg/nuclide-ios-common
rm -rf pkg/nuclide-ios-simulator-logs
rm -rf pkg/nuclide-jasmine
rm -rf pkg/nuclide-json
rm -rf pkg/nuclide-language-hack
rm -rf pkg/nuclide-language-reason
rm -rf pkg/nuclide-loaded-shell-hook
rm -rf pkg/nuclide-marshalers-atom
rm -rf pkg/nuclide-marshalers-common
rm -rf pkg/nuclide-move-item-to-available-pane
rm -rf pkg/nuclide-navigation-stack
rm -rf pkg/nuclide-objc
rm -rf pkg/nuclide-ocaml
rm -rf pkg/nuclide-ocaml-rpc
rm -rf pkg/nuclide-open-filenames-provider
rm -rf pkg/nuclide-project
rm -rf pkg/nuclide-python
rm -rf pkg/nuclide-python-rpc
rm -rf pkg/nuclide-quick-open
rm -rf pkg/nuclide-react-inspector
rm -rf pkg/nuclide-react-native
rm -rf pkg/nuclide-react-native-base
rm -rf pkg/nuclide-recent-files-provider
rm -rf pkg/nuclide-recent-files-service
rm -rf pkg/nuclide-refactorizer
rm -rf pkg/nuclide-related-files
rm -rf pkg/nuclide-remote-atom
rm -rf pkg/nuclide-remote-atom-rpc
rm -rf pkg/nuclide-remote-connection
rm -rf pkg/nuclide-remote-projects
rm -rf pkg/nuclide-rpc
rm -rf pkg/nuclide-server
rm -rf pkg/nuclide-source-control-helpers
rm -rf pkg/nuclide-source-control-side-bar
rm -rf pkg/nuclide-swift
rm -rf pkg/nuclide-task
rm -rf pkg/nuclide-task-runner
rm -rf pkg/nuclide-test-runner
rm -rf pkg/nuclide-unicode-datatip
rm -rf pkg/nuclide-url-hyperclick
rm -rf pkg/nuclide-vcs-log
rm -rf pkg/nuclide-version
rm -rf pkg/nuclide-vscode-language-service
rm -rf pkg/nuclide-watchman-helpers
rm -rf pkg/nuclide-working-sets
rm -rf pkg/nuclide-working-sets-common
rm -rf pkg/sample-datatip
rm -rf pkg/sample-diagnostics-provider
rm -rf pkg/sample-executor
rm -rf pkg/sample-logging-console
rm -rf pkg/sample-lsp-tester
rm -rf pkg/sample-rm -rf pkg/nuclide-contributors
rm -rf pkg/sample-nux-example
rm -rf pkg/sample-quickopen-provider-example
rm -rf pkg/sample-ui-playground
rm -rf pkg/sample-web-view
rm -rf pkg/sample-workspace-views-example

# Remove Tests
find pkg -name spec | xargs rm -rf
rm -rf spec

# Files which should be moved to other packages.
rm pkg/commons-atom/arcanist.js
rm pkg/commons-atom/remote-text-buffer.js
rm pkg/commons-atom/streamProcessToConsoleMessages.js
rm pkg/commons-atom/vcs.js
rm pkg/nuclide-ui/ChangedFilesList.js
rm pkg/nuclide-ui/LazyNestedValueComponent.js
rm pkg/nuclide-ui/MultiRootChangedFilesView.example.js
rm pkg/nuclide-ui/MultiRootChangedFilesView.js
rm pkg/nuclide-ui/SimpleValueComponent.js
rm pkg/nuclide-debugger-interfaces/service.js

# Parts of the LS but not well enough factored
rm -rf pkg/nuclide-find-references
rm -rf pkg/nuclide-definition-preview

# Bits of unrelated packages we just need types from
git checkout pkg/nuclide-debugger/lib/types.js
git checkout pkg/nuclide-find-references/lib/rpc-types.js

# Bits of the remoting Framework that are pulled in
git checkout pkg/nuclide-remote-connection/lib/ConnectionCache.js
git checkout pkg/nuclide-remote-connection/package.json

# Move the remoting shim over
cp pkg/local-remote-connection/lib/* pkg/nuclide-remote-connection/lib
rm -rf pkg/local-remote-connection

# Suppress the errors about importing fb only files
sed -i.tmp -e 's/^; \(suppress_comment=.*FlowFB.*\)$/\1/' .flowconfig
./node_modules/.bin/flow check --show-all-errors
