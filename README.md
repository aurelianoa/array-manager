# Array Manager

The `array-manager` is a simple abstract contract to add/remove and find items in an array.

## How to install

```bash
npm install @aurelianoa/array-manager

yarn add @aurelianoa/array-manager

pnpm add @aurelianoa/array-manager
```

## Usage

The `array-manager` provides contracts that allow to interact with arrays of:
- addresses
- bytes32
- uints
- strings

Every contract does provide: 

```bash
/// Find in array
/// @param _array the array
/// @param lookUp the address to look up
/// @return the index of the address in the array
function findInArray(
        address[] memory _array, 
        address lookUp
) internal pure returns(uint256);

/// Is in Array
/// @param _array the array
/// @param lookUp the address to look up
/// @return true if the address is in the array
function isInArray(
    address[] memory _array, 
    address lookUp
) internal pure returns (bool)

/// Remove from array
/// @param _array the array
/// @param the address to be removed
function removeFromArray(
    address[] storage _array, 
    address lookUp
) internal;

/// Add to array
/// @param _array the array
/// @param newValue the address to be added
/// @notice if the address is already in the array, do not add it
function addToArray(
    address[] storage _array, 
    address newValue
) internal;
/// Add to array Unckecked
/// @param _array the array
/// @param newValue the address to be added
/// @notice add the value to the array without checking if it is already in the array
function addToArrayUnchecked(
    address[] storage _array, 
    address newValue
) internal
```
Every function works the same but with their respective data types

## License

This code is licensed under the MIT license.