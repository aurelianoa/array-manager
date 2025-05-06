// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
/// @title UintArrayManager
/// @author Aureliano Alarcon Smith @aurealacon @aurelianoa
/// @notice This contract is used to manage arrays of uint
import {IArrayManager} from "./interfaces/IArrayManager.sol";
abstract contract UintArrayManager is IArrayManager {
    uint8 constant private _VERSION = 1_0_0;
    /// @inheritdoc IArrayManager
    function VERSION() external pure returns (uint8) {
        return _VERSION;
    }
    /// Find in array
    /// @param _array the array
    /// @param lookUp the number to look up
    /// @return the index of the number in the array
    function findInArray(
        uint[] memory _array, 
        uint lookUp
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
    /// @param lookUp the number to look up
    /// @return true if the number is in the array
    function isInArray(
        uint[] memory _array, 
        uint lookUp
    ) internal pure returns (bool) {
        return findInArray(_array, lookUp) < _array.length;
    }

    /// Remove from array
    /// @param _array the array
    /// @param index the index of the number to be removed
    function removeFromArray(
        uint[] storage _array, 
        uint index
    ) internal {
        if(index > _array.length) return;
        _array[index] = _array[_array.length - 1];
        _array.pop();
    }
    /// Add to array
    /// @param _array the array
    /// @param newValue the number to be added
    /// @notice if the number is already in the array, do not add it
    function addToArray(
        uint[] storage _array, 
        uint newValue
    ) internal {
        if(isInArray(_array, newValue)) return;
        _array.push(newValue);
    }
}