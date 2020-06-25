pragma solidity >=0.4.22;

contract Bole {
    // The promoter asks questions and pays.
    struct student{
        address StudentAddress;
        uint Bounty;
        uint ExpectedTime;
        string Question;
//        uint TeacherAcoount;
//        mapping(uint => teacher) map;
    }
    
    struct teacher{
        address TeacherAddress;
        uint studentnum;
        uint CompleteTime;
        uint Pays;
        string Answer;
    }
    
    uint studentAmount = 0;
    mapping(address => uint) Idstudent;
    mapping(uint => student) studentmap;
    
    uint teacherAmount = 0;
    mapping(address => uint) Idteacher;
    mapping(uint => teacher) teachermap;

    function getsender() view public returns(uint,address){
        return (msg.sender.balance,msg.sender);
    }

    function Newstudent(uint _Bounty,uint _ExpectedTime,string memory _Question) public {
        address _StudentAddress = msg.sender;
        studentAmount++;
        Idstudent[_StudentAddress] = studentAmount;
        studentmap[studentAmount] = student(_StudentAddress,_Bounty,_ExpectedTime,_Question);
    }
    
    function Newteacher(uint _sutdentAmount,string memory _Answer) public{
        address _TeacherAddress = msg.sender;
        teacherAmount++;
        uint Pays = 1;
        Idteacher[_TeacherAddress] = teacherAmount;
        teachermap[teacherAmount] = teacher(_TeacherAddress,_sutdentAmount,now,Pays,_Answer);
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
    
}
