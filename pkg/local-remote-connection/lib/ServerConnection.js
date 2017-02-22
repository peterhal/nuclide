/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 *
 * @flow
 */


import type {NuclideUri} from '../../commons-node/nuclideUri';

// Dummy For local only distro
export class ServerConnection {
  static getForUri(uri: NuclideUri): ?ServerConnection { return null; }
  static toDebugString(connection: ?ServerConnection): string { return "local"; }
  static onDidCloseServerConnection(handler: (connection: ServerConnection) => mixed): IDisposable {
    return {
      dispose(): void {}
    };
  }
  static observeConnections(handler: (connection: ServerConnection) => mixed): IDisposable {
    return {
      dispose(): void {}
    };
  }

  getRemoteHostname(): string { return ""; }
}
