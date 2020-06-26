pragma solidity >=0.4.16;

contract Bole {
    
    address public owner;
    constructor() public { owner = msg.sender; }
    
    uint public num = 0;
    mapping(address => uint) idmap;
    mapping(uint => Registry) regmap;
    
    struct Registry{
        address senderAddr;
        string name;
        bool used;
    }
    
    struct question{
        address StudentAddress;
        uint Bounty;
        uint ExpectedTime;
        string Question;
//        uint TeacherAcoount;
//        mapping(uint => teacher) map;
    }
    
    struct answer{
        address TeacherAddress;
        uint studentnum;
        uint CompleteTime;
        uint Pays;
        string Answer;
    }
    
    function Register(string calldata _name) external onlyRegister{
        num++;
        idmap[msg.sender] = num;
        regmap[num] = Registry(msg.sender,_name,true);
    }
    
    
    
    uint studentAmount = 0;
    mapping(address => uint) Idstudent;
    mapping(uint => question) studentmap;
    
    uint teacherAmount = 0;
    mapping(address => uint) Idteacher;
    mapping(uint => answer) teachermap;

    function getsender() view public returns(uint,address){
        return (msg.sender.balance,msg.sender);
    }
    
    function getthis() view public returns(address,uint){
        return (address(this),address(this).balance);
    }

    function Newstudent(uint _Bounty,uint _ExpectedTime,string memory _Question) public {
        address _StudentAddress = msg.sender;
        studentAmount++;
        Idstudent[_StudentAddress] = studentAmount;
        studentmap[studentAmount] = question(_StudentAddress,_Bounty,_ExpectedTime,_Question);
    }
    
    function Newteacher(uint _sutdentAmount,string memory _Answer) public{
        address _TeacherAddress = msg.sender;
        teacherAmount++;
        uint Pays = 1;
        Idteacher[_TeacherAddress] = teacherAmount;
        teachermap[teacherAmount] = answer(_TeacherAddress,_sutdentAmount,now,Pays,_Answer);
        teachermap[_sutdentAmount] = teachermap[teacherAmount];
        
    }
     
    function getStudent(address are) view  public returns(address,uint,uint,string memory){
        address a = studentmap[Idstudent[are]].StudentAddress;
        uint    b = studentmap[Idstudent[are]].Bounty;
        uint    c = studentmap[Idstudent[are]].ExpectedTime;
        string memory  d = studentmap[Idstudent[are]].Question;
        return (a,b,c,d);
        
    }
    function getStudent_am(uint _sutdentAmount) view  public returns(address,uint,uint,string memory){
        address a = studentmap[_sutdentAmount].StudentAddress;
        uint    b = studentmap[_sutdentAmount].Bounty;
        uint    c = studentmap[_sutdentAmount].ExpectedTime;
        string memory  d = studentmap[_sutdentAmount].Question;
        return (a,b,c,d);
        
    }
    
    function getanswer(uint _sutdentAmount) view public returns(address,uint,uint,uint,string memory){
        address a = teachermap[_sutdentAmount].TeacherAddress;
        uint b = teachermap[_sutdentAmount].studentnum;
        uint c = teachermap[_sutdentAmount].CompleteTime;
        uint d = teachermap[_sutdentAmount].Pays;
        string memory e = teachermap[_sutdentAmount].Answer;
        return (a,b,c,d,e);
    }
    
    function getregistry(uint _num) view public returns(address,string memory){
        address a = regmap[_num].senderAddr;
        string memory b = regmap[_num].name;
        
        return (a,b);
    }
    
    
    function Transfer() public payable {
        address(this).transfer(msg.value);
    }
    
    function () external payable{
    }
    function getglobal() view public returns(uint){
        return tx.gasprice;
    }
    function kill() external onlyowner{
        // if (msg.sender == owner) selfdestruct(address(this));
        selfdestruct(address(this));
    }
    
    modifier onlyowner(){
        require(owner == msg.sender,'You are not owner.');
        _;
    }
    
    modifier onlyRegister(){
        require(! regmap[idmap[msg.sender]].used,'You have already registered.');
        _;
    }
}
