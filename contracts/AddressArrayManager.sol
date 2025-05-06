// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
/// @title AddressArrayManager
/// @author Aureliano Alarcon Smith @aurealacon @aurelianoa
/// @notice This contract is used to manage arrays of addresses
import {IArrayManager} from "./interfaces/IArrayManager.sol";
abstract contract AddressArrayManager is IArrayManager {
    uint8 constant private _VERSION = 1_0_0;
    /// @inheritdoc IArrayManager
    function VERSION() external pure returns (uint8) {
        return _VERSION;
    }
    /// Find in array
    /// @param _array the array
    /// @param lookUp the address to look up
    /// @return the index of the address in the array
    function findInArray(
        address[] memory _array, 
        address lookUp
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
    /// @param lookUp the address to look up
    /// @return true if the address is in the array
    function isInArray(
        address[] memory _array, 
        address lookUp
    ) internal pure returns (bool) {
        return findInArray(_array, lookUp) < _array.length;
    }
    /// Remove from array
    /// @param _array the array
    /// @param index the index of the address to be removed
    function removeFromArray(
        address[] storage _array, 
        uint index
    ) internal {
        if(index > _array.length) return;
        _array[index] = _array[_array.length - 1];
        _array.pop();
    }
    /// Add to array
    /// @param _array the array
    /// @param newValue the address to be added
    /// @notice if the address is already in the array, do not add it
    function addToArray(
        address[] storage _array, 
        address newValue
    ) internal {
        if(isInArray(_array, newValue)) return;
        _array.push(newValue);
    }
}