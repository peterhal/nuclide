/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 *
 * @flow
 */

import type {ServerConnection} from './ServerConnection';
import type {NuclideUri} from '../../commons-node/nuclideUri';
import nuclideUri from '../../commons-node/nuclideUri';

export {ConnectionCache} from '../../nuclide-remote-connection/lib/ConnectionCache';
export {ServerConnection} from './ServerConnection';

export function getServiceByConnection(service: string, connection: ?ServerConnection): any {
  switch (service) {
    case 'FlowService':
      return require('../../nuclide-flow-rpc/lib/FlowService');
    case 'OpenFilesService':
      return require('../../nuclide-open-files-rpc/lib/OpenFilesService');
    default:
      throw new Error(`Unexpected service in ${service} getServiceByConnection`);
  }
}

export function getServiceByNuclideUri(service: string, uri: ?NuclideUri): any {
  return getServiceByConnection(service, null);
}
