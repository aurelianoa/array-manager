// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
/// @title Bytes32ArrayManager
/// @author Aureliano Alarcon Smith @aurealacon @aurelianoa
/// @notice This contract is used to manage arrays bytes32
import {IArrayManager} from "./interfaces/IArrayManager.sol";
abstract contract Bytes32ArrayManager is IArrayManager {
    uint8 constant private _VERSION = 1_0_0;
    /// @inheritdoc IArrayManager
    function VERSION() external pure returns (uint8) {
        return _VERSION;
    }
    /// Find in array
    /// @param _array the array
    /// @param lookUp the bytes32 to look up
    /// @return the index of the bytes32 in the array
    function findInArray(
        bytes32[] memory _array, 
        bytes32 lookUp
    ) internal pure returns(uint256) {
        uint256 i = 0;
        /// @notice set up out of bounds
        uint256 found_index = _array.length; 
        while (i < _array.length) {
            if(_array[i] == lookUp) {
                found_index = i;
                break;
            }
            unchecked { ++i; }
        }
        return found_index;
    }
    /// Is in Array
    /// @param _array the array
    /// @param lookUp the bytes32 to look up
    /// @return true if the bytes32 is in the array
    function isInArray(
        bytes32[] memory _array, 
        bytes32 lookUp
    ) internal pure returns (bool) {
        return findInArray(_array, lookUp) < _array.length;
    }

    /// Remove from array
    /// @param _array the array
    /// @param index the index of the bytes32 to be removed
    function removeFromArray(
        bytes32[] storage _array, 
        uint index
    ) internal {
        if(index > _array.length) return;
        _array[index] = _array[_array.length - 1];
        _array.pop();
    }
    /// Add to array
    /// @param _array the array
    /// @param newValue the bytes32 to be added
    /// @notice if the bytes32 is already in the array, do not add it
    function addToArray(
        bytes32[] storage _array, 
        bytes32 newValue
    ) internal {
        if(isInArray(_array, newValue)) return;
        _array.push(newValue);
    }
}