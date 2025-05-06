// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface IArrayManager {
    /// errors
    error InvalidArrayLength();
    /// version
    function VERSION() external returns (uint8);
}