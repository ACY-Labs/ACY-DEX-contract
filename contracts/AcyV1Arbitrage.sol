/**
 *Submitted for verification at Etherscan.io on 2021-07-10
*/

pragma solidity =0.6.6;

interface IAcyV1Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

interface IAcyV1Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);

    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;

    function initialize(address, address) external;
}


interface IAcyV1Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IAcyV1Router02 is IAcyV1Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}


interface IBEP20 {
    function totalSupply() external view returns (uint256);
    function decimals() external view returns (uint8);
    function symbol() external view returns (string memory);
    function name() external view returns (string memory);
    function getOwner() external view returns (address);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address _owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IAcyV2Pair {
    function getPairReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function factoryPair() external view returns (address);
    function kLast() external view returns (uint);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
}

contract AcyV2Pair is IAcyV2Pair{

    address public pair;
    // AA token:0x5F59f7fdAa5816f366477888ABC404A51E6a89fb
    // BB token:0xaCDbbAD9921653B076a7dDe2e1375bCD3D262894
    // CC token:0xED8524117020869b4BA1b699Cf3b032e39bBBe92
    
    constructor(address _pair) public {
        pair = _pair;
    }

    function getPairReserves() override external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast){
        return IAcyV1Pair(pair).getReserves();
    }
    
    function factoryPair() override external view returns (address){
        return IAcyV1Pair(pair).factory();
    }
    function kLast() override external view returns (uint){
        return IAcyV1Pair(pair).kLast();
    }
    function token0() override external view returns (address){
        return IAcyV1Pair(pair).token0();
    }
    function token1() override external view returns (address){
        return IAcyV1Pair(pair).token1();
    }
    function price0CumulativeLast() override external view returns (uint){
        return IAcyV1Pair(pair).price0CumulativeLast();
    }
    function price1CumulativeLast() override external view returns (uint){
        return IAcyV1Pair(pair).price1CumulativeLast();
    }

}

interface IAcyV1Arbitrage {
    //function addTokenPair(address tokenA, address tokenB) external returns (address);
    function getIndirectToken(address inputToken, address outputToken) external view returns ( address );
    function calculOutputAmount(uint112 inputAmount, address inputToken, address outputToken) external view returns ( uint112 outputTokenAmount);
    function getOutputAmountAPI(uint112 inputAmount, address tokenAddress,address pairAddress) external view returns (uint112);
    function getPairForAPI(address tokenA, address tokenB) external view returns (address);
    function initToken(address _tokenAA,address _tokenBB,address _tokenCC) external;
}

contract AcyV1Arbitrage is IAcyV1Arbitrage {
    
    address public factory;
    address public router;
    
    // official version
    //mapping(address => address[]) public tokenPairs;
    // beta version
    mapping(address => mapping(address => address)) indirectTokens;
    
    
    address tokenAA;
    address tokenBB;
    address tokenCC;
    
    IBEP20 public token;
    
    constructor(address _factory,address _router,address _tokenAA,address _tokenBB,address _tokenCC) public {
        factory = _factory;
        router = _router;
        tokenAA = _tokenAA;
        tokenBB = _tokenBB;
        tokenCC = _tokenCC;
        indirectTokens[tokenAA][tokenBB] = tokenCC;
        indirectTokens[tokenBB][tokenCC] = tokenAA;
        indirectTokens[tokenBB][tokenAA] = tokenCC;
        indirectTokens[tokenCC][tokenAA] = tokenBB;
        indirectTokens[tokenCC][tokenBB] = tokenAA;
    }
    
    function initToken(address _tokenAA,address _tokenBB,address _tokenCC)  override external {
        tokenAA = _tokenAA;
        tokenBB = _tokenBB;
        tokenCC = _tokenCC;
        indirectTokens[tokenAA][tokenBB] = tokenCC;
        // indirectTokens[tokenAA][tokenCC] = tokenBB;
        indirectTokens[tokenBB][tokenCC] = tokenAA;
        indirectTokens[tokenBB][tokenAA] = tokenCC;
        indirectTokens[tokenCC][tokenAA] = tokenBB;
        indirectTokens[tokenCC][tokenBB] = tokenAA;
    }
    
    function swap(uint amountIn,address inputToken,address outputToken) external {
        address[] memory arr = new address[](2);
        arr[0] = inputToken;
        arr[1] = outputToken;
        uint deadline = block.timestamp + 300;
        uint amountOutMin = (uint(this.getOutputAmountAPI(uint112(amountIn), inputToken, outputToken))/100)*59;
        // require(amountOutMin > 0 ,"amountIn error");
        // bool approveFlag = IBEP20(inputToken).approve(msg.sender, amountIn);
        // require(approveFlag,"approve token error");
        // require(IBEP20(inputToken).allowance(msg.sender, address(this))>=amountIn,"allowance error");
        
        //IAcyV1Router02(router).swapExactTokensForTokensSupportingFeeOnTransferTokens(amountIn,amountOutMin, arr, msg.sender, deadline);
    }
    
    function returnAllowance(address inputToken) external view returns(uint) {
        return IBEP20(inputToken).allowance(msg.sender, address(this));
    }
    
    function returnSwap() external view returns(address) {
        return msg.sender;
    }
    
    function getIndirectToken(address inputToken, address outputToken) override external view returns ( address indirectToken ){
        indirectToken = indirectTokens[inputToken][outputToken];
    }
    
    // 仅适用于三角套利数量计算
    function calculOutputAmount(uint112 inputAmount, address inputToken, address outputToken) override external view returns ( uint112 outputTokenAmount){
        outputTokenAmount = this.getOutputAmountAPI(
                this.getOutputAmountAPI(
                    inputAmount,
                    inputToken,
                    this.getIndirectToken(inputToken,outputToken)),
            this.getIndirectToken(inputToken,outputToken),
            outputToken);
    }


    function getOutputAmountAPI(uint112 inputAmount, address inputTokenAddress,address outputTokenAddress) override external view returns (uint112 amountOut){
        address pairAddress = this.getPairForAPI(inputTokenAddress,outputTokenAddress);
        require(pairAddress != address(0),"pairAddress error");
        (uint112 reserve0, uint112 reserve1, ) = IAcyV1Pair(pairAddress).getReserves();
        require(inputTokenAddress == IAcyV1Pair(pairAddress).token0() || inputTokenAddress == IAcyV1Pair(pairAddress).token1(),"token error");
        
        if(inputTokenAddress == IAcyV1Pair(pairAddress).token1()){
            uint112 tmp = reserve1;
            reserve1 = reserve0;
            reserve0 = tmp;
        } 
        require(inputAmount < reserve0 ,"inputAmount error");
        return uint112(AcyV1Library.getAmountOut(uint(inputAmount), uint(reserve0), uint(reserve1)));
    }
    
    function getPairForAPI(address tokenA, address tokenB) override external view returns (address){
        return AcyV1Library.pairFor(factory, tokenA, tokenB);
    }
    
    // real function
    // function getArbitragePath(address inputToken, address outputToken,address[] path) external returns (address[] memory){
    //     if(tokenPairs[inputToken].length == 0 || tokenPairs[outputToken].length == 0) return new address[](0);
    //     // 图的遍历
    // }
    
    // function addTokenPair(address tokenA, address tokenB) external returns (address){
    //     tokenPairs[tokenA].push(tokenB);
    //     tokenPairs[tokenB].push(tokenA);
    // }
    
    // function getTokenPair(address token) external view returns ( address[] memory ){
    //     return tokenPairs[token];
    // }
    
}


library AcyV1Library {
    using SafeMath for uint;

    // returns sorted token addresses, used to handle return values from pairs sorted in this order
    function sortTokens(address tokenA, address tokenB) internal pure returns (address token0, address token1) {
        require(tokenA != tokenB, 'AcyV1Library: IDENTICAL_ADDRESSES');
        (token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        require(token0 != address(0), 'AcyV1Library: ZERO_ADDRESS');
    }

    // calculates the CREATE2 address for a pair without making any external calls
    function pairFor(address factory, address tokenA, address tokenB) internal pure returns (address pair) {
        (address token0, address token1) = sortTokens(tokenA, tokenB);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'e5a5c0eebcf8889af35630d48a65b9cc0b2dbff9197b89a717c06930734aa10b' // init code hash
            ))));
    }

    // fetches and sorts the reserves for a pair
    function getReserves(address factory, address tokenA, address tokenB) internal view returns (uint reserveA, uint reserveB) {
        (address token0,) = sortTokens(tokenA, tokenB);
        (uint reserve0, uint reserve1,) = IAcyV1Pair(pairFor(factory, tokenA, tokenB)).getReserves();
        (reserveA, reserveB) = tokenA == token0 ? (reserve0, reserve1) : (reserve1, reserve0);
    }

    // given some amount of an asset and pair reserves, returns an equivalent amount of the other asset
    function quote(uint amountA, uint reserveA, uint reserveB) internal pure returns (uint amountB) {
        require(amountA > 0, 'AcyV1Library: INSUFFICIENT_AMOUNT');
        require(reserveA > 0 && reserveB > 0, 'AcyV1Library: INSUFFICIENT_LIQUIDITY');
        amountB = amountA.mul(reserveB) / reserveA;
    }

    // given an input amount of an asset and pair reserves, returns the maximum output amount of the other asset
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) internal pure returns (uint amountOut) {
        require(amountIn > 0, 'AcyV1Library: INSUFFICIENT_INPUT_AMOUNT');
        require(reserveIn > 0 && reserveOut > 0, 'AcyV1Library: INSUFFICIENT_LIQUIDITY');
        uint amountInWithFee = amountIn.mul(997);
        uint numerator = amountInWithFee.mul(reserveOut);
        uint denominator = reserveIn.mul(1000).add(amountInWithFee);
        amountOut = numerator / denominator;
    }

    // given an output amount of an asset and pair reserves, returns a required input amount of the other asset
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) internal pure returns (uint amountIn) {
        require(amountOut > 0, 'AcyV1Library: INSUFFICIENT_OUTPUT_AMOUNT');
        require(reserveIn > 0 && reserveOut > 0, 'AcyV1Library: INSUFFICIENT_LIQUIDITY');
        uint numerator = reserveIn.mul(amountOut).mul(1000);
        uint denominator = reserveOut.sub(amountOut).mul(997);
        amountIn = (numerator / denominator).add(1);
    }

    // performs chained getAmountOut calculations on any number of pairs
    function getAmountsOut(address factory, uint amountIn, address[] memory path) internal view returns (uint[] memory amounts) {
        require(path.length >= 2, 'AcyV1Library: INVALID_PATH');
        amounts = new uint[](path.length);
        amounts[0] = amountIn;
        for (uint i; i < path.length - 1; i++) {
            (uint reserveIn, uint reserveOut) = getReserves(factory, path[i], path[i + 1]);
            amounts[i + 1] = getAmountOut(amounts[i], reserveIn, reserveOut);
        }
    }

    // performs chained getAmountIn calculations on any number of pairs
    function getAmountsIn(address factory, uint amountOut, address[] memory path) internal view returns (uint[] memory amounts) {
        require(path.length >= 2, 'AcyV1Library: INVALID_PATH');
        amounts = new uint[](path.length);
        amounts[amounts.length - 1] = amountOut;
        for (uint i = path.length - 1; i > 0; i--) {
            (uint reserveIn, uint reserveOut) = getReserves(factory, path[i - 1], path[i]);
            amounts[i - 1] = getAmountIn(amounts[i], reserveIn, reserveOut);
        }
    }
}

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
}
