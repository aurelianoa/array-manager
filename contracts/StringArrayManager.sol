// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
/// @title StringsArrayManager
/// @author Aureliano Alarcon Smith @aurealacon @aurelianoa
/// @notice This contract is used to manage arrays of strings
import {IArrayManager} from "./interfaces/IArrayManager.sol";
abstract contract StringArrayManager is IArrayManager {
    /// Find in array
    /// @param _array the array
    /// @param lookUp the string to look up
    /// @return the index of the string in the array
    function findInArray(
        string[] memory _array, 
        string memory lookUp
    ) internal pure returns(uint256) {
        uint256 i = 0;
        /// @notice set up out of bounds
        uint256 found_index = _array.length; 
        while (i < _array.length) {
            if(compareStrings(_array[i],lookUp)) {
                found_index = i;
                break;
            }
            unchecked { ++i; }
        }
        return found_index;
    }
    /// Is in Array
    /// @param _array the array
    /// @param lookUp the string to look up
    /// @return true if the string is in the array
    function isInArray(
        string[] memory _array, 
        string memory lookUp
    ) internal pure returns (bool) {
        return findInArray(_array, lookUp) < _array.length;
    }
    /// Remove from array
    /// @param _array the array
    /// @param index the index of the string to be removed
    function removeFromArrayWithIndex(
        string[] storage _array, 
        uint index
    ) internal {
        if(index > _array.length) return;
        _array[index] = _array[_array.length - 1];
        _array.pop();
    }
    /// Remove from array
    /// @param _array the array
    /// @param lookUp the string to be removed
    /// @notice if the string is not in the array, do not remove it
    /// @notice if the value is duplicated, remove the first one
    function removeFromArray(
        string[] storage _array, 
        string memory lookUp
    ) internal {
        /// @notice avoid out of bounds
        if(!isInArray(_array, lookUp)) return;
        uint256 index = findInArray(_array, lookUp);
        removeFromArrayWithIndex(_array, index);
    }
    /// Add to array
    /// @param _array the array
    /// @param newValue the string to be added
    /// @notice if the string is already in the array, do not add it
    function addToArray(
        string[] storage _array, 
        string memory newValue
    ) internal {
        if(isInArray(_array, newValue)) return;
        _array.push(newValue);
    }
    /// Add to array Unckecked
    /// @param _array the array
    /// @param newValue the string to be added
    /// @notice add the value to the array without checking if it is already in the array
    function addToArrayUnchecked(
        string[] storage _array, 
        string memory newValue
    ) internal {
        _array.push(newValue);
    }
    /// compare strings
    /// @param a the first string
    /// @param b the second string
    /// @return true if the strings are equal
    function compareStrings(
        string memory a, 
        string memory b
    ) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}