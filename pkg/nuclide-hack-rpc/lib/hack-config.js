'use strict';
'use babel';

/*
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 */

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getHackExecOptions = exports.logger = undefined;

var _asyncToGenerator = _interopRequireDefault(require('async-to-generator'));

var _slicedToArray = function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"]) _i["return"](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError("Invalid attempt to destructure non-iterable instance"); } }; }();

// Returns the empty string on failure
let findHackCommand = (() => {
  var _ref = (0, _asyncToGenerator.default)(function* () {
    // `stdout` would be empty if there is no such command.
    return (yield (0, (_process || _load_process()).asyncExecute)('which', [PATH_TO_HH_CLIENT])).stdout.trim();
  });

  return function findHackCommand() {
    return _ref.apply(this, arguments);
  };
})();

let getHackExecOptions = exports.getHackExecOptions = (() => {
  var _ref2 = (0, _asyncToGenerator.default)(function* (localFile) {
    var _ref3 = yield Promise.all([hackCommand, findHackConfigDir(localFile)]),
        _ref4 = _slicedToArray(_ref3, 2);

    const currentHackCommand = _ref4[0],
          hackRoot = _ref4[1];

    if (hackRoot && currentHackCommand) {
      return { hackRoot: hackRoot, hackCommand: currentHackCommand };
    } else {
      return null;
    }
  });

  return function getHackExecOptions(_x) {
    return _ref2.apply(this, arguments);
  };
})();

exports.findHackConfigDir = findHackConfigDir;
exports.setHackCommand = setHackCommand;
exports.getHackCommand = getHackCommand;

var _fsPromise;

function _load_fsPromise() {
  return _fsPromise = _interopRequireDefault(require('../../commons-node/fsPromise'));
}

var _process;

function _load_process() {
  return _process = require('../../commons-node/process');
}

var _nuclideLogging;

function _load_nuclideLogging() {
  return _nuclideLogging = require('../../nuclide-logging');
}

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const HACK_LOGGER_CATEGORY = 'nuclide-hack';
const logger = exports.logger = (0, (_nuclideLogging || _load_nuclideLogging()).getCategoryLogger)(HACK_LOGGER_CATEGORY);

const HACK_CONFIG_FILE_NAME = '.hhconfig';
const PATH_TO_HH_CLIENT = 'hh_client';

// Kick this off early, so we don't need to repeat this on every call.
// We don't have a way of changing the path on the dev server after a
// connection is made so this shouldn't change over time.
// Worst case scenario is requiring restarting Nuclide after changing the hh_client path.
const DEFAULT_HACK_COMMAND = findHackCommand();
let hackCommand = DEFAULT_HACK_COMMAND;

/**
* If this returns null, then it is not safe to run hack.
*/
function findHackConfigDir(localFile) {
  return (_fsPromise || _load_fsPromise()).default.findNearestFile(HACK_CONFIG_FILE_NAME, localFile);
}function setHackCommand(newHackCommand) {
  if (newHackCommand === '') {
    hackCommand = DEFAULT_HACK_COMMAND;
  } else {
    logger.logTrace(`Using custom hh_client: ${ newHackCommand }`);
    hackCommand = Promise.resolve(newHackCommand);
  }
}

function getHackCommand() {
  return hackCommand;
}