// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.7.6;

interface IAcyV1Point {
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event RouterTransferred(address indexed previousRouter, address indexed newRouter);

    function getPoint(address startingPoint) external view returns(address[] memory);
    function pushPoint(address startingPoint, address pushedPoint) external;
}

contract AcyV1Point{
    address private _owner;
    address private _router;
    
    mapping(address => address[]) internal pointList;
    
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event RouterTransferred(address indexed previousRouter, address indexed newRouter);
    
     /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _setOwner(_msgSender());
    }
    
    function getPoint(address startingPoint) external view returns(address[] memory){
        return pointList[startingPoint];
    }
    
    function pushPoint(address startingPoint, address pushedPoint) external onlyRouter {
        pointList[startingPoint].push(pushedPoint);
    }
    
    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }
    
    /**
     * @dev Returns the address of the current router.
     */
    function router() public view virtual returns (address) {
        return _router;
    }
    
    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    
    
    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyRouter() {
        require(router() == _msgSender(), "onlyRouter: caller is not the router");
        _;
    }
    
    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
    
    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferRouter(address newRouter) public virtual onlyOwner {
        require(newRouter != address(0), "TransferRouter: new router is the zero address");
        _setRouter(newRouter);
    }
    
    function _setRouter(address newRouter) private {
        address oldRouter = _router;
        _router = newRouter;
        emit RouterTransferred(oldRouter, newRouter);
    }
    
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}
