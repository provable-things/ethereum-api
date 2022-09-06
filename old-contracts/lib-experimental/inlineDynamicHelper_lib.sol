pragma solidity ^0.4.6 < 0.5;

/*
    Helper for declaring inline dynamic string arrays
*/

library InlineDynamicHelper {
    function toDynamic(string[1] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[2] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[3] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[4] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[5] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[6] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[7] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[8] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[9] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[10] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[11] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[12] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[13] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[14] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[15] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
    function toDynamic(string[16] self)
    internal
    returns (string[]) {
        string[] memory dyna = new string[](self.length);
        for (uint i = 0; i < dyna.length; i++) {
            dyna[i] = self[i];
        }
        return dyna;
    }
}

contract usingInlineDynamic {
    using InlineDynamicHelper for string[1];
    using InlineDynamicHelper for string[2];
    using InlineDynamicHelper for string[3];
    using InlineDynamicHelper for string[4];
    using InlineDynamicHelper for string[5];
    using InlineDynamicHelper for string[6];
    using InlineDynamicHelper for string[7];
    using InlineDynamicHelper for string[8];
    using InlineDynamicHelper for string[9];
    using InlineDynamicHelper for string[10];
    using InlineDynamicHelper for string[11];
    using InlineDynamicHelper for string[12];
    using InlineDynamicHelper for string[13];
    using InlineDynamicHelper for string[14];
    using InlineDynamicHelper for string[15];
    using InlineDynamicHelper for string[16];
}
