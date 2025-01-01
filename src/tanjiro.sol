//SPDX-LICENSE-Identifier: MIT;
pragma solidity ^ 0.8.20;
 contract Tanjiro {
    address public owner;
    uint256 public supply;
    mapping(address => uint256) public  balances;
    mapping(address => mapping(address=>uint256)) public approvedTransfers; 
    event Transfer(address indexed _from , address  indexed _to, uint256 _amount); 
    event Approval(address indexed _owner, address indexed _spender, uint256 _amount); 
    constructor(uint256 _supply) {
        supply = _supply;
        owner = msg.sender;
        balances[msg.sender]= _supply; 
    } 
    function transfer(address _to, uint256 _amount) external  returns (bool){
      require(balances[msg.sender] >= _amount, "insufficient balance"); 
      balances[msg.sender] -= _amount; 
      balances[_to] += _amount; 
      emit Transfer(msg.sender, _to, _amount); 
      return true; 
    }
    function allowance(address _owner, address _spender)  external view  returns (uint256){
      return approvedTransfers[_owner][_spender]; 
    }
    function approve(address _spender, uint256 _amount) external  returns (bool){
      require(balances[msg.sender] >= _amount, "insufficient balance"); 
      approvedTransfers[msg.sender][_spender] = _amount; 
      emit Approval(msg.sender, _spender, _amount); 
      return true; 
    }
    function transferFrom(address _from, address _to, uint256 _amount) external  returns (bool){
      require(approvedTransfers[_from][msg.sender] >= _amount, "insufficient balance"); 
      balances[_from] = balances[_from] - _amount; 
      approvedTransfers[_from][msg.sender] -= _amount; 
      balances[_to] = balances[_to] + _amount;
      emit Transfer(_from, _to, _amount); 
      return true; 
    }
    // getter and setter functions 
    function name() public pure  returns (string memory) {
        return "Tanjiro";
    }
    function totalSupply() public view returns (uint256) {
        return supply;
    }
    function symbol() public pure  returns (string memory) {
        return "Tanjiro";
    }
    function balanceOf(address _account) external view  returns (uint256) {
        return balances[_account];
    }
    function decimals() public pure returns (uint8){
      return 2; 
    }
    
}
