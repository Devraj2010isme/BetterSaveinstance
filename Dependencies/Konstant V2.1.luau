local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_getscriptbytecode_0 = getscriptbytecode;
local l_getscripthash_0 = getscripthash;
local _ = getgenv;
--local l_rconsoleprint_0 = rconsoleprint;
local v14 = Vector3 or {
    new = function(v11, v12, v13)
        return {
            X = v11, 
            Y = v12, 
            Z = v13
        };
    end
};
local v15 = nil;
local v16 = nil;
local v17 = {};
local function v21()
    if v16 == "vanilla" then
        v15 = function(v18)
            return v18;
        end;
    elseif v16 == "mul227" then
        v15 = function(v19)
            return v19 * 227;
        end;
    else
        error("Invalid opcode_encoding_type");
    end;
    for v20 = 0, 255 do
        v17[v15(v20)] = v20;
    end;
end;
local v22 = {
    use_proto_debugnames = true, 
    show_proto_line_defined = true, 
    show_proto_upvalues = true, 
    show_proto_constants = true, 
    inline_table_initialization = true, 
    table_string_key_shortening = true, 
    table_dict_key_semicolons = true, 
    table_array_value_semicolons = false, 
    always_use_table_keys = false, 
    use_compound_assignment = true, 
    exact_argument_names = false, 
    string_quotes_behavior = "single char, single quotes", 
    do_tonumber_nan = true, 
    do_while_1 = false, 
    show_nil_definitions = true, 
    smart_var_level = 3, 
    smart_var_usage_analysis = true, 
    smart_var_extensive_prefixes = false, 
    mark_upvalues = "extra", 
    mark_setglobal = true, 
    mark_reads_and_writes = false, 
    minify_if_statements = true, 
    assume_if_else = true, 
    prefix_error = "KONSTANTERROR", 
    prefix_warning = "KONSTANTWARNING", 
    prefix_information = "KONSTANTINFO"
};
local v23 = if task then task.wait else nil;
local v24 = {
    [0] = "nil", 
    [1] = "boolean", 
    [2] = "number", 
    [3] = "string", 
    [4] = "import", 
    [5] = "table", 
    [6] = "function", 
    [7] = "vector"
};
local l_clock_0 = os.clock;
local v26 = elapsedTime or l_clock_0;
local v27 = v26();
local v28 = game ~= nil;
--local v29 = l_rconsoleprint_0 or print;
local function v33(v30, v31, v32)
    if v26() - v27 >= 0.016666666666666666 then
       -- v29("[" .. v30 .. "/" .. v31 .. "] " .. string.format("%.1f", math.floor(v30 / v31 * 1000 + 0.5) / 10) .. "% done with func `" .. (v32 or "<main>") .. "`");
        if v23 and v28 then
            v23();
        end;
        v27 = v26();
    end;
end;
local function v43()
    return {
        start_times = {}, 
        end_times = {}, 
        completed_benchmarks = {}, 
        start_benchmark = function(_, _)

        end, 
        end_benchmark = function(_, _)

        end, 
        get_benchmark_time = function(_, _)
            return 0;
        end, 
        print_benchmark_time = function(_, _)

        end, 
        print_all_times = function(_)

        end
    };
end;
local v44 = buffer.create(8);
local function _(v45)
    return (bit32.band(bit32.rshift(v45, 8), 255));
end;
local function _(v47)
    return (bit32.band(bit32.rshift(v47, 16), 255));
end;
local function _(v49)
    return (bit32.band(bit32.rshift(v49, 24), 255));
end;
local function _(v51)
    return (bit32.band(bit32.rshift(v51, 16), 65535));
end;
local function _(v53)
    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v53, 16), 65535)));
    return (buffer.readi16(v44, 0));
end;
local function _(v55)
    return (bit32.rshift(v55, 8));
end;
local function _(v57)
    buffer.writeu32(v44, 0, (bit32.rshift(v57, 8)));
    return (bit32.rshift(buffer.readi32(v44, 1), 16));
end;
local function _(v59)
    return (bit32.band(v59, 255));
end;
local v61 = {
    A = true, 
    a = true, 
    E = true, 
    e = true, 
    I = true, 
    i = true, 
    O = true, 
    o = true, 
    U = true, 
    u = true
};
local function _(v62)
    return string.format("%X", v62);
end;
local v64 = {};
for v65 = 0, 255 do
    v64[v65] = string.format("%.2X", v65);
end;
local v66 = buffer.create(2);
local v67 = {};
for v68 = 0, 255 do
    buffer.writestring(v66, 0, v64[v68]);
    v67[v68] = buffer.readu16(v66, 0);
end;
local v69 = {};
for v70 = 0, 255 do
    v69[v70] = bit32.bor(bit32.lrotate(v67[v70], 16), 30812);
end;
local function _(v71)
    return v64[v71];
end;
local function _(v73)
    return string.format("%.4X", v73);
end;
local function _(v75)
    return v64[bit32.rshift(v75, 24)] .. v64[bit32.band(bit32.rrotate(v75, 16), 255)] .. v64[bit32.band(bit32.rrotate(v75, 8), 255)] .. v64[bit32.band(v75, 255)];
end;
local function _(v77)
    assert(v77);
    return v77;
end;
local function _(v79, v80)
    table.clear(v79);
    for v81, v82 in pairs(v80) do
        v79[v81] = v82;
    end;
end;
local function v89(v84, v85)
    if #v85 > 8 then
        return table.move(v85, 1, #v85, 1, table.clone(v84));
    else
        local v86 = table.clone(v84);
        for _, v88 in ipairs(v85) do
            table.insert(v86, v88);
        end;
        return v86;
    end;
end;
local function _(v90, v91)
    local v92 = table.clone(v90);
    for v93 in pairs(v91) do
        v92[v93] = true;
    end;
    return v92;
end;
local function _(v95, v96, v97)
    local v98 = table.find(v95, v96);
    assert(v98);
    if v97 == nil then
        table.remove(v95, v98);
    else
        v95[v98] = v97;
    end;
    assert(not table.find(v95, v96));
end;
local function _(v100, v101, v102)
    for v103 = #v100, 1, -1 do
        if v100[v103] == v101 then
            if v102 == nil then
                table.remove(v100, v103);
                return;
            else
                v100[v103] = v102;
                return;
            end;
        end;
    end;
end;
local function v109(v105)
    local v106 = table.clone(v105);
    for v107, v108 in pairs(v106) do
        if type(v108) == "table" then
            v106[v107] = table.clone(v108);
        end;
    end;
    return v106;
end;
local function _(v110, v111)
    local v112 = v110[v111];
    if v112 then
        return v112;
    else
        local v113 = {};
        v110[v111] = v113;
        return v113;
    end;
end;
local function _(v115)
    assert(#v115 > 0);
end;
local function _(v117, v118)
    local v119 = table.create(v117, v118);
    if v118 then
        v119[0] = v118;
        return v119;
    else
        v119[0] = nil;
        return v119;
    end;
end;
local v121 = {};
local function _(v122, v123, v124)
    local v125 = v122[v123];
    if v125 then
        return v125[v124];
    else
        return nil;
    end;
end;
local function _(v127, v128, v129, v130)
    local v131 = v127[v128];
    if v131 then
        v131[v129] = v130;
        return;
    else
        v127[v128] = {
            [v129] = v130
        };
        return;
    end;
end;
local _ = function(v133, v134)
    for _, v136 in ipairs(v133) do
        if table.find(v134, v136) then
            return v136;
        end;
    end;
    return nil;
end;
local function _()
    v121 = {};
end;
local function v139(v140, v141, v142)
    local v143 = v121[v140];
    local v144 = if v143 then v143[v141] else nil;
    if v144 then
        return v144;
    else
        local v145 = v142 or {};
        for v146, v147 in v140 do
            if type(v146) == "table" then
                if not v145[v146] then
                    v145[v146] = true;
                    if v146 == v141 then
                        local l_v121_0 = v121;
                        local v149 = l_v121_0[v140];
                        if v149 then
                            v149[v141] = true;
                        else
                            l_v121_0[v140] = {
                                [v141] = true
                            };
                        end;
                        return true;
                    elseif v139(v147, v141, v145) then
                        local l_v121_1 = v121;
                        local v151 = l_v121_1[v140];
                        if v151 then
                            v151[v141] = true;
                        else
                            l_v121_1[v140] = {
                                [v141] = true
                            };
                        end;
                        return true;
                    end;
                end;
            elseif type(v147) == "table" and not v145[v147] then
                v145[v147] = true;
                if v147 == v141 then
                    local l_v121_2 = v121;
                    local v153 = l_v121_2[v140];
                    if v153 then
                        v153[v141] = true;
                    else
                        l_v121_2[v140] = {
                            [v141] = true
                        };
                    end;
                    return true;
                elseif v139(v147, v141, v145) then
                    local l_v121_3 = v121;
                    local v155 = l_v121_3[v140];
                    if v155 then
                        v155[v141] = true;
                    else
                        l_v121_3[v140] = {
                            [v141] = true
                        };
                    end;
                    return true;
                end;
            end;
        end;
        v143 = v121;
        local v156 = v143[v140];
        if v156 then
            v156[v141] = false;
        else
            v143[v140] = {
                [v141] = false
            };
        end;
        return false;
    end;
end;
local function _(v157, v158)
    if v158 then
        return {
            beginning = v157, 
            ending = v158
        };
    else
        return {
            beginning = v157, 
            ending = v157
        };
    end;
end;
local function _(v160)
    return v160.ending - v160.beginning + 1;
end;
local function _(v162, v163)
    local v164 = false;
    if v162.beginning == v163.beginning then
        v164 = v162.ending == v163.ending;
    end;
    return v164;
end;
local function _(v166)
    return (("range<%*:%*>"):format(v166.beginning, v166.ending));
end;
local function _(v168, v169, v170)
    local v171 = false;
    if v169 <= v168 then
        v171 = v168 <= v170;
    end;
    return v171;
end;
local function _(v173, v174)
    local l_beginning_0 = v174.beginning;
    local l_ending_0 = v174.ending;
    local v177 = false;
    if l_beginning_0 <= v173 then
        v177 = v173 <= l_ending_0;
    end;
    return v177;
end;
local v179 = nil;
local v180 = nil;
local v181 = nil;
local function _(v182)
    local v183 = v180[v182];
    if not v183 then
        error((("Unknown opname %*"):format(v182)));
    end;
    return v183;
end;
local function _(v185)
    return v181[v185];
end;
local v187 = {
    "LOADB", 
    "JUMP", 
    "JUMPBACK", 
    "JUMPIF", 
    "JUMPIFNOT", 
    "JUMPIFEQ", 
    "JUMPIFLE", 
    "JUMPIFLT", 
    "JUMPIFNOTEQ", 
    "JUMPIFNOTLE", 
    "JUMPIFNOTLT", 
    "FORNPREP", 
    "FORNLOOP", 
    "FORGLOOP", 
    "FORGPREP", 
    "FORGPREP_INEXT", 
    "DEP_FORGLOOP_INEXT", 
    "FORGPREP_NEXT", 
    "JUMPX", 
    "JUMPXEQKNIL", 
    "JUMPXEQKB", 
    "JUMPXEQKN", 
    "JUMPXEQKS", 
    "DEP_JUMPIFEQK", 
    "DEP_JUMPIFNOTEQK"
};
local v188 = nil;
local v189 = nil;
local function v212(v190)
    v21();
    local v191 = nil;
    if v190 >= 4 and v190 <= 6 then
        local v192 = {
            opname = "DEP_JUMPIFEQK", 
            aux = false
        };
        local v193 = {
            opname = "SUBRK", 
            aux = false
        };
        local v194 = {
            opname = "DEP_JUMPIFNOTEQK", 
            aux = false
        };
        local v195 = {
            opname = "DIVRK", 
            aux = false
        };
        local v196 = {
            opname = "DEP_FORGLOOP_INEXT", 
            aux = false
        };
        local v197 = {
            opname = "FASTCALL3", 
            aux = true
        };
        v191 = {
            {
                opname = "NOP", 
                aux = false
            }, 
            {
                opname = "BREAK", 
                aux = false
            }, 
            {
                opname = "LOADNIL", 
                aux = false
            }, 
            {
                opname = "LOADB", 
                aux = false
            }, 
            {
                opname = "LOADN", 
                aux = false
            }, 
            {
                opname = "LOADK", 
                aux = false
            }, 
            {
                opname = "MOVE", 
                aux = false
            }, 
            {
                opname = "GETGLOBAL", 
                aux = true
            }, 
            {
                opname = "SETGLOBAL", 
                aux = true
            }, 
            {
                opname = "GETUPVAL", 
                aux = false
            }, 
            {
                opname = "SETUPVAL", 
                aux = false
            }, 
            {
                opname = "CLOSEUPVALS", 
                aux = false
            }, 
            {
                opname = "GETIMPORT", 
                aux = true
            }, 
            {
                opname = "GETTABLE", 
                aux = false
            }, 
            {
                opname = "SETTABLE", 
                aux = false
            }, 
            {
                opname = "GETTABLEKS", 
                aux = true
            }, 
            {
                opname = "SETTABLEKS", 
                aux = true
            }, 
            {
                opname = "GETTABLEN", 
                aux = false
            }, 
            {
                opname = "SETTABLEN", 
                aux = false
            }, 
            {
                opname = "NEWCLOSURE", 
                aux = false
            }, 
            {
                opname = "NAMECALL", 
                aux = true
            }, 
            {
                opname = "CALL", 
                aux = false
            }, 
            {
                opname = "RETURN", 
                aux = false
            }, 
            {
                opname = "JUMP", 
                aux = false
            }, 
            {
                opname = "JUMPBACK", 
                aux = false
            }, 
            {
                opname = "JUMPIF", 
                aux = false
            }, 
            {
                opname = "JUMPIFNOT", 
                aux = false
            }, 
            {
                opname = "JUMPIFEQ", 
                aux = true
            }, 
            {
                opname = "JUMPIFLE", 
                aux = true
            }, 
            {
                opname = "JUMPIFLT", 
                aux = true
            }, 
            {
                opname = "JUMPIFNOTEQ", 
                aux = true
            }, 
            {
                opname = "JUMPIFNOTLE", 
                aux = true
            }, 
            {
                opname = "JUMPIFNOTLT", 
                aux = true
            }, 
            {
                opname = "ADD", 
                aux = false
            }, 
            {
                opname = "SUB", 
                aux = false
            }, 
            {
                opname = "MUL", 
                aux = false
            }, 
            {
                opname = "DIV", 
                aux = false
            }, 
            {
                opname = "MOD", 
                aux = false
            }, 
            {
                opname = "POW", 
                aux = false
            }, 
            {
                opname = "ADDK", 
                aux = false
            }, 
            {
                opname = "SUBK", 
                aux = false
            }, 
            {
                opname = "MULK", 
                aux = false
            }, 
            {
                opname = "DIVK", 
                aux = false
            }, 
            {
                opname = "MODK", 
                aux = false
            }, 
            {
                opname = "POWK", 
                aux = false
            }, 
            {
                opname = "AND", 
                aux = false
            }, 
            {
                opname = "OR", 
                aux = false
            }, 
            {
                opname = "ANDK", 
                aux = false
            }, 
            {
                opname = "ORK", 
                aux = false
            }, 
            {
                opname = "CONCAT", 
                aux = false
            }, 
            {
                opname = "NOT", 
                aux = false
            }, 
            {
                opname = "MINUS", 
                aux = false
            }, 
            {
                opname = "LENGTH", 
                aux = false
            }, 
            {
                opname = "NEWTABLE", 
                aux = true
            }, 
            {
                opname = "DUPTABLE", 
                aux = false
            }, 
            {
                opname = "SETLIST", 
                aux = true
            }, 
            {
                opname = "FORNPREP", 
                aux = false
            }, 
            {
                opname = "FORNLOOP", 
                aux = false
            }, 
            {
                opname = "FORGLOOP", 
                aux = true
            }, 
            {
                opname = "FORGPREP_INEXT", 
                aux = false
            }, 
            v196, 
            {
                opname = "FORGPREP_NEXT", 
                aux = false
            }, 
            {
                opname = "NATIVECALL", 
                aux = false
            }, 
            {
                opname = "GETVARARGS", 
                aux = false
            }, 
            {
                opname = "DUPCLOSURE", 
                aux = false
            }, 
            {
                opname = "PREPVARARGS", 
                aux = false
            }, 
            {
                opname = "LOADKX", 
                aux = false
            }, 
            {
                opname = "JUMPX", 
                aux = false
            }, 
            {
                opname = "FASTCALL", 
                aux = false
            }, 
            {
                opname = "COVERAGE", 
                aux = false
            }, 
            {
                opname = "CAPTURE", 
                aux = false
            }, 
            v193, 
            v195, 
            {
                opname = "FASTCALL1", 
                aux = false
            }, 
            {
                opname = "FASTCALL2", 
                aux = true
            }, 
            {
                opname = "FASTCALL2K", 
                aux = true
            }, 
            {
                opname = "FORGPREP", 
                aux = false
            }, 
            {
                opname = "JUMPXEQKNIL", 
                aux = true
            }, 
            {
                opname = "JUMPXEQKB", 
                aux = true
            }, 
            {
                opname = "JUMPXEQKN", 
                aux = true
            }, 
            {
                opname = "JUMPXEQKS", 
                aux = true
            }, 
            {
                opname = "IDIV", 
                aux = false
            }, 
            {
                opname = "IDIVK", 
                aux = false
            }, 
            {
                opname = "COUNT", 
                aux = false
            }
        };
        if v190 < 1 then
            local v198 = table.find(v191, v193);
            assert(v198);
            v191[v198] = v192;
            v198 = table.find(v191, v195);
            assert(v198);
            v191[v198] = v194;
        end;
        if v190 >= 6 then
            local v199 = table.find(v191, v196);
            assert(v199);
            v191[v199] = v197;
        end;
    elseif v190 >= 16 then
        error((("Luau version %* not supported. You likely didn't input Luau bytecode, or the bytecode was encoded. No encoding is supported."):format(v190)));
    else
        error((("Luau version %* not supported."):format(v190)));
    end;
    v179 = {};
    for v200, v201 in ipairs(v191) do
        local l_aux_0 = v201.aux;
        v179[v200] = {
            opname = v201.opname, 
            aux = l_aux_0, 
            opcode = -1, 
            real_opcode = -1, 
            size = l_aux_0 and 2 or 1
        };
    end;
    for v203, v204 in ipairs(v179) do
        local v205 = v203 - 1;
        v204.real_opcode = v205;
        v204.opcode = bit32.band(v15(v205), 255);
    end;
    v180 = {};
    v181 = {};
    for _, v207 in pairs(v179) do
        v180[v207.opname] = v207;
        v181[v207.opcode] = v207;
    end;
    v188 = {};
    v189 = {};
    for _, v209 in pairs(v187) do
        if v180[v209] then
            local v210 = v180[v209];
            if not v210 then
                error((("Unknown opname %*"):format(v209)));
            end;
            local l_v210_0 = v210;
            v188[v209] = true;
            v189[l_v210_0.opcode] = true;
        end;
    end;
end;
local _ = {
    LOADB = true, 
    JUMP = true, 
    JUMPBACK = true, 
    JUMPX = true
};
local v214 = {
    addition = "+=", 
    subtraction = "-=", 
    multiplication = "*=", 
    division = "/=", 
    ["floor division"] = "//=", 
    exponentiation = "^=", 
    concatenation = "..=", 
    modulus = "%="
};
local v215 = {
    [">"] = "<=", 
    ["<="] = ">", 
    ["<"] = ">=", 
    [">="] = "<", 
    ["=="] = "~=", 
    ["~="] = "==", 
    exist = "not exist", 
    ["not exist"] = "exist"
};
local v216 = {
    [">"] = "<", 
    ["<"] = ">", 
    ["<="] = ">=", 
    [">="] = "<=", 
    ["=="] = "==", 
    ["~="] = "~=", 
    exist = "not exist", 
    ["not exist"] = "exist"
};
local v217 = {
    ["end"] = true, 
    ["if"] = true, 
    ["local"] = true, 
    ["else"] = true, 
    ["elseif"] = true, 
    ["function"] = true, 
    ["break"] = true, 
    ["then"] = true, 
    ["and"] = true, 
    ["or"] = true, 
    ["repeat"] = true, 
    ["until"] = true, 
    ["for"] = true, 
    ["do"] = true, 
    ["in"] = true, 
    ["nil"] = true, 
    ["true"] = true, 
    ["false"] = true, 
    ["not"] = true, 
    ["return"] = true
};
local v218 = {
    ["for"] = true
};
local v219 = {
    call = true, 
    varargs = true
};
local v220 = {
    [0] = "<none>"; 
    "assert", 
    "math.abs", 
    "math.acos", 
    "math.asin", 
    "math.atan2", 
    "math.atan", 
    "math.ceil", 
    "math.cosh", 
    "math.cos", 
    "math.deg", 
    "math.exp", 
    "math.floor", 
    "math.fmod", 
    "math.frexp", 
    "math.ldexp", 
    "math.log10", 
    "math.log", 
    "math.max", 
    "math.min", 
    "math.modf", 
    "math.pow", 
    "math.rad", 
    "math.sinh", 
    "math.sin", 
    "math.sqrt", 
    "math.tanh", 
    "math.tan", 
    "bit32.arshift", 
    "bit32.band", 
    "bit32.bnot", 
    "bit32.bor", 
    "bit32.bxor", 
    "bit32.btest", 
    "bit32.extract", 
    "bit32.lrotate", 
    "bit32.lshift", 
    "bit32.replace", 
    "bit32.rrotate", 
    "bit32.rshift", 
    "type", 
    "string.byte", 
    "string.char", 
    "string.len", 
    "typeof", 
    "string.sub", 
    "math.clamp", 
    "math.sign", 
    "math.round", 
    "rawset", 
    "rawget", 
    "rawequal", 
    "table.insert", 
    "table.unpack", 
    "vector", 
    "bit32.countlz", 
    "bit32.countrz", 
    "select.vararg", 
    "rawlen", 
    "bit32.extractk", 
    "getmetatable", 
    "setmetatable", 
    "tonumber", 
    "tostring", 
    "bit32.byteswap", 
    "buffer.readi8", 
    "buffer.readu8", 
    "buffer.writeu8", 
    "buffer.readi16", 
    "buffer.readu16", 
    "buffer.writeu16", 
    "buffer.readi32", 
    "buffer.readu32", 
    "buffer.writeu32", 
    "buffer.readf32", 
    "buffer.writef32", 
    "buffer.readf64", 
    "buffer.writef64"
};
local function _(v221)
    table.move(v221, 1, #v221, 0, v221);
    table.remove(v221, #v221);
end;
local function _(v223, v224)
    if v224 then
        return not v223;
    else
        return v223;
    end;
end;
local function v296(v226)
    local v227 = nil;
    v227 = if type(v226) == "buffer" then v226 else buffer.fromstring(v226);
    v27 = l_clock_0();
    local v228 = 0;
    local function _()
        local v229 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        return v229;
    end;
    local function v235()
        local v231 = nil;
        local v232 = 0;
        local v233 = 0;
        while true do
            local v234 = buffer.readu8(v227, v228);
            v228 = v228 + 1;
            v231 = v234;
            v233 = bit32.bor(v233, (bit32.lshift(bit32.band(v231, 127), v232)));
            v232 = v232 + 7;
            if not (bit32.band(v231, 128) ~= 0) then
                break;
            end;
        end;
        return v233;
    end;
    local function _()
        local v236 = buffer.readu32(v227, v228);
        v228 = v228 + 4;
        return v236;
    end;
    local function _()
        local v238 = buffer.readf32(v227, v228);
        v228 = v228 + 4;
        return v238;
    end;
    local function _()
        local v240 = buffer.readf64(v227, v228);
        v228 = v228 + 8;
        return v240;
    end;
    local function v244()
        local v242 = v235();
        local v243 = buffer.create(v242);
        buffer.copy(v243, 0, v227, v228, v242);
        v228 = v228 + v242;
        return buffer.tostring(v243);
    end;
    local v245 = buffer.readu8(v227, v228);
    v228 = v228 + 1;
    local l_v245_0 = v245;
    v212(l_v245_0);
    v245 = nil;
    if l_v245_0 >= 4 then
        local v247 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v245 = v247;
        if v245 > 3 then
            error((("Types version %* not supported. Only version 1 is supported."):format(v245)));
        end;
    end;
    local v248 = {};
    local v249 = {};
    for _ = 1, v235() do
        table.insert(v249, v244());
    end;
    local _ = {};
    if v245 == 3 then
        local v252 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        local l_v252_0 = v252;
        while l_v252_0 ~= 0 do
            print("IN");
            local v254 = v235();
            local v255 = buffer.create(v254);
            buffer.copy(v255, 0, v227, v228, v254);
            v228 = v228 + v254;
            v252 = buffer.tostring(v255);
            print(v252);
            v254 = buffer.readu8(v227, v228);
            v228 = v228 + 1;
            l_v252_0 = v254;
        end;
    end;
    local v256 = v235();
    if buffer.len(v227) / 11 <= v256 then
        error("Corrupted bytecode. If the `luau_load` is able to load this bytecode, then this is a bug");
    end;
    for _ = 1, v256 do
        table.insert(v248, {});
    end;
    for v258 = 1, v256 do
        local v259 = v248[v258];
        local v260 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v259.stack_size = v260;
        v260 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v259.params_count = v260;
        v260 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v259.upvalues_count = v260;
        local v261 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v259.is_vararg = v261 ~= 0;
        v260 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v259.flags = v260;
        local v262 = {};
        if v245 == 1 then
            for v263 = 1, v235() do
                local v264 = buffer.readu8(v227, v228);
                v228 = v228 + 1;
                v262[v263] = v264;
            end;
        elseif not (v245 ~= 2) or v245 == 3 then
            for v265 = 1, v235() do
                local v266 = buffer.readu8(v227, v228);
                v228 = v228 + 1;
                v262[v265] = v266;
            end;
        end;
        v259.type_info = v262;
        table.move(v262, 1, #v262, 0, v262);
        table.remove(v262, #v262);
        v260 = v235();
        v261 = table.create(v260);
        for v267 = 1, v260 do
            local v268 = buffer.readu32(v227, v228);
            v228 = v228 + 4;
            v261[v267] = v268;
        end;
        v259.code = v261;
        table.move(v261, 1, #v261, 0, v261);
        table.remove(v261, #v261);
        local v269 = v235();
        local v270 = table.create(v269);
        for _ = 1, v269 do
            local v272 = nil;
            local v273 = buffer.readu8(v227, v228);
            v228 = v228 + 1;
            local l_v273_0 = v273;
            if l_v273_0 == 2 then
                v273 = {
                    type = 2
                };
                local v275 = buffer.readf64(v227, v228);
                v228 = v228 + 8;
                v273.value = v275;
                v272 = v273;
            elseif l_v273_0 == 3 then
                v272 = {
                    type = 3, 
                    value = v249[v235()]
                };
            elseif l_v273_0 == 6 then
                v272 = {
                    type = 6, 
                    value = v235()
                };
            elseif l_v273_0 == 5 then
                v272 = {
                    type = 5, 
                    value = {}
                };
                for _ = 1, v235() do
                    v235();
                end;
            elseif l_v273_0 == 4 then
                v273 = buffer.readu32(v227, v228);
                v228 = v228 + 4;
                v272 = {
                    type = 4, 
                    value = nil
                };
            elseif l_v273_0 == 1 then
                v273 = {
                    type = 1
                };
                local v277 = buffer.readu8(v227, v228);
                v228 = v228 + 1;
                v273.value = v277 ~= 0;
                v272 = v273;
            elseif l_v273_0 == 0 then
                v272 = {
                    type = 0, 
                    value = nil
                };
            elseif l_v273_0 == 7 and l_v245_0 >= 5 then
                v273 = {
                    type = 7
                };
                local l_new_0 = v14.new;
                local v279 = buffer.readf32(v227, v228);
                v228 = v228 + 4;
                local l_v279_0 = v279;
                local v281 = buffer.readf32(v227, v228);
                v228 = v228 + 4;
                v279 = v281;
                local v282 = buffer.readf32(v227, v228);
                v228 = v228 + 4;
                v273.value = l_new_0(l_v279_0, v279, v282);
                v272 = v273;
                v273 = buffer.readf32(v227, v228);
                v228 = v228 + 4;
            else
                error((("Unknown constant type %*"):format(l_v273_0)));
            end;
            table.insert(v270, v272);
        end;
        table.move(v270, 1, #v270, 0, v270);
        table.remove(v270, #v270);
        v259.constants = v270;
        local v283 = v235();
        local v284 = table.create(v283);
        for _ = 1, v283 do
            table.insert(v284, v248[v235() + 1]);
        end;
        table.move(v284, 1, #v284, 0, v284);
        table.remove(v284, #v284);
        v259.protos = v284;
        v259.line_defined = v235();
        v259.debug_name = v249[v235()];
        local v286 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        if v286 > 0 then
            local v287 = buffer.readu8(v227, v228);
            v228 = v228 + 1;
            v286 = v287;
            v287 = table.create(v260);
            for _ = 1, v260 do
                local v289 = buffer.readu8(v227, v228);
                v228 = v228 + 1;
                table.insert(v287, v289);
            end;
            table.move(v287, 1, #v287, 0, v287);
            table.remove(v287, #v287);
            v259.line_info = v287;
            local _ = bit32.band(v260 + 3, -4);
            local v291 = bit32.rshift(v260 - 1, v286) + 1;
            local v292 = table.create(v291);
            for _ = 1, v291 do
                local v294 = buffer.readu32(v227, v228);
                v228 = v228 + 4;
                table.insert(v292, v294);
            end;
            table.move(v287, 1, #v287, 0, v287);
            table.remove(v287, #v287);
            v259.line_info = v287;
        end;
        local v295 = buffer.readu8(v227, v228);
        v228 = v228 + 1;
        v286 = v295;
        if v286 > 0 then
            if v286 == 1 then
                error("g2 unsupported by deserializer");
            else
                error((("g2 unsupported by deserializer (%*)"):format(v64[v286])));
            end;
        end;
    end;
    table.move(v248, 1, #v248, 0, v248);
    table.remove(v248, #v248);
    return v248[v235()], v248, l_v245_0, v245;
end;
local v297 = 0;
local v298 = 0;
local v299 = nil;
local v300 = nil;
local v301 = nil;
local v302 = 0;
local function v304(_)
    return {}, {};
end;
local v460 = {
    FASTCALL = v304, 
    FASTCALL1 = v304, 
    FASTCALL2 = v304, 
    FASTCALL2K = v304, 
    FASTCALL3 = v304, 
    JUMP = v304, 
    JUMPX = v304, 
    JUMPBACK = v304, 
    COVERAGE = v304, 
    CLOSEUPVALS = v304, 
    PREPVARARGS = v304, 
    GETVARARGS = function(v305)
        local l_inst_0 = v305.inst;
        local v307 = bit32.band(bit32.rshift(l_inst_0, 8), 255);
        local v308 = {};
        local v309 = bit32.band(bit32.rshift(l_inst_0, 16), 255) - 1;
        if v309 == -1 then
            v309 = 1;
            v298 = v307;
        end;
        for v310 = v307, v307 + v309 - 1 do
            table.insert(v308, v310);
        end;
        return {}, v308;
    end, 
    MOVE = function(v311)
        local l_inst_1 = v311.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_1, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_1, 8), 255))
        }, "copies";
    end, 
    LOADK = function(v313)
        return {}, {
            (bit32.band(bit32.rshift(v313.inst, 8), 255))
        };
    end, 
    LOADKX = function(v314)
        return {}, {
            (bit32.band(bit32.rshift(v314.inst, 8), 255))
        };
    end, 
    LOADN = function(v315)
        return {}, {
            (bit32.band(bit32.rshift(v315.inst, 8), 255))
        };
    end, 
    LOADNIL = function(v316)
        return {}, {
            (bit32.band(bit32.rshift(v316.inst, 8), 255))
        };
    end, 
    LOADB = function(v317)
        return {}, {
            (bit32.band(bit32.rshift(v317.inst, 8), 255))
        };
    end, 
    NEWTABLE = function(v318)
        return {}, {
            (bit32.band(bit32.rshift(v318.inst, 8), 255))
        };
    end, 
    DUPTABLE = function(v319)
        return {}, {
            (bit32.band(bit32.rshift(v319.inst, 8), 255))
        };
    end, 
    SETTABLE = function(v320)
        local l_inst_2 = v320.inst;
        return {
            bit32.band(bit32.rshift(l_inst_2, 24), 255), 
            bit32.band(bit32.rshift(l_inst_2, 8), 255), 
            (bit32.band(bit32.rshift(l_inst_2, 16), 255))
        }, {};
    end, 
    SETTABLEKS = function(v322)
        local l_inst_3 = v322.inst;
        return {
            bit32.band(bit32.rshift(l_inst_3, 8), 255), 
            (bit32.band(bit32.rshift(l_inst_3, 16), 255))
        }, {};
    end, 
    SETTABLEN = function(v324)
        local l_inst_4 = v324.inst;
        return {
            bit32.band(bit32.rshift(l_inst_4, 8), 255), 
            (bit32.band(bit32.rshift(l_inst_4, 16), 255))
        }, {};
    end, 
    GETTABLE = function(v326)
        local l_inst_5 = v326.inst;
        return {
            bit32.band(bit32.rshift(l_inst_5, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_5, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_5, 8), 255))
        };
    end, 
    GETTABLEKS = function(v328)
        local l_inst_6 = v328.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_6, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_6, 8), 255))
        };
    end, 
    GETTABLEN = function(v330)
        local l_inst_7 = v330.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_7, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_7, 8), 255))
        };
    end, 
    SETLIST = function(v332)
        local l_inst_8 = v332.inst;
        local v334 = bit32.band(bit32.rshift(l_inst_8, 8), 255);
        local v335 = bit32.band(bit32.rshift(l_inst_8, 16), 255);
        local v336 = bit32.band(bit32.rshift(l_inst_8, 24), 255) - 1;
        local v337 = {};
        local l_v335_0 = v335;
        local v339 = if v336 == -1 then v298 else v335 + v336 - 1;
        for v340 = l_v335_0, v339 do
            table.insert(v337, v340);
        end;
        for _ = 1, #v337 do
            table.insert(v337, v334);
        end;
        return v337, {};
    end, 
    GETUPVAL = function(v342)
        return {}, {
            (bit32.band(bit32.rshift(v342.inst, 8), 255))
        };
    end, 
    SETUPVAL = function(v343)
        return {
            (bit32.band(bit32.rshift(v343.inst, 8), 255))
        }, {};
    end, 
    GETIMPORT = function(v344)
        return {}, {
            (bit32.band(bit32.rshift(v344.inst, 8), 255))
        };
    end, 
    GETGLOBAL = function(v345)
        return {}, {
            (bit32.band(bit32.rshift(v345.inst, 8), 255))
        };
    end, 
    SETGLOBAL = function(v346)
        return {
            (bit32.band(bit32.rshift(v346.inst, 8), 255))
        }, {};
    end, 
    NAMECALL = function(v347)
        local l_inst_9 = v347.inst;
        local v349 = bit32.band(bit32.rshift(l_inst_9, 8), 255);
        return {
            (bit32.band(bit32.rshift(l_inst_9, 16), 255))
        }, {
            v349, 
            v349 + 1
        };
    end, 
    RETURN = function(v350)
        local l_inst_10 = v350.inst;
        local v352 = bit32.band(bit32.rshift(l_inst_10, 8), 255);
        local v353 = bit32.band(bit32.rshift(l_inst_10, 16), 255) - 1;
        local v354 = {};
        local l_v352_0 = v352;
        local v356 = if v353 == -1 then v298 else v352 + v353 - 1;
        for v357 = l_v352_0, v356 do
            table.insert(v354, v357);
        end;
        return v354, {};
    end, 
    CALL = function(v358)
        local l_inst_11 = v358.inst;
        local v360 = bit32.band(bit32.rshift(l_inst_11, 8), 255);
        local v361 = bit32.band(bit32.rshift(l_inst_11, 16), 255) - 1;
        local v362 = bit32.band(bit32.rshift(l_inst_11, 24), 255) - 1;
        if v361 == -1 then
            v361 = v298 - v360;
        end;
        local v363 = {
            v360
        };
        local v364 = {};
        for v365 = v360 + 1, v360 + v361 do
            table.insert(v363, v365);
        end;
        if v362 == -1 then
            v362 = 1;
            v298 = v360;
        end;
        for v366 = v360, v360 + v362 - 1 do
            table.insert(v364, v366);
        end;
        return v363, v364;
    end, 
    DUPCLOSURE = function(v367)
        return {}, {
            (bit32.band(bit32.rshift(v367.inst, 8), 255))
        };
    end, 
    NEWCLOSURE = function(v368)
        return {}, {
            (bit32.band(bit32.rshift(v368.inst, 8), 255))
        };
    end, 
    ADD = function(v369)
        local l_inst_12 = v369.inst;
        return {
            bit32.band(bit32.rshift(l_inst_12, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_12, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_12, 8), 255))
        };
    end, 
    ADDK = function(v371)
        local l_inst_13 = v371.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_13, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_13, 8), 255))
        };
    end, 
    SUB = function(v373)
        local l_inst_14 = v373.inst;
        return {
            bit32.band(bit32.rshift(l_inst_14, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_14, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_14, 8), 255))
        };
    end, 
    SUBK = function(v375)
        local l_inst_15 = v375.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_15, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_15, 8), 255))
        };
    end, 
    MUL = function(v377)
        local l_inst_16 = v377.inst;
        return {
            bit32.band(bit32.rshift(l_inst_16, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_16, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_16, 8), 255))
        };
    end, 
    MULK = function(v379)
        local l_inst_17 = v379.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_17, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_17, 8), 255))
        };
    end, 
    DIV = function(v381)
        local l_inst_18 = v381.inst;
        return {
            bit32.band(bit32.rshift(l_inst_18, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_18, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_18, 8), 255))
        };
    end, 
    DIVK = function(v383)
        local l_inst_19 = v383.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_19, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_19, 8), 255))
        };
    end, 
    SUBRK = function(v385)
        local l_inst_20 = v385.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_20, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_20, 8), 255))
        };
    end, 
    DIVRK = function(v387)
        local l_inst_21 = v387.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_21, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_21, 8), 255))
        };
    end, 
    IDIV = function(v389)
        local l_inst_22 = v389.inst;
        return {
            bit32.band(bit32.rshift(l_inst_22, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_22, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_22, 8), 255))
        };
    end, 
    IDIVK = function(v391)
        local l_inst_23 = v391.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_23, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_23, 8), 255))
        };
    end, 
    POW = function(v393)
        local l_inst_24 = v393.inst;
        return {
            bit32.band(bit32.rshift(l_inst_24, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_24, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_24, 8), 255))
        };
    end, 
    POWK = function(v395)
        local l_inst_25 = v395.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_25, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_25, 8), 255))
        };
    end, 
    MOD = function(v397)
        local l_inst_26 = v397.inst;
        return {
            bit32.band(bit32.rshift(l_inst_26, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_26, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_26, 8), 255))
        };
    end, 
    MODK = function(v399)
        local l_inst_27 = v399.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_27, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_27, 8), 255))
        };
    end, 
    AND = function(v401)
        local l_inst_28 = v401.inst;
        return {
            bit32.band(bit32.rshift(l_inst_28, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_28, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_28, 8), 255))
        };
    end, 
    ANDK = function(v403)
        local l_inst_29 = v403.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_29, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_29, 8), 255))
        };
    end, 
    OR = function(v405)
        local l_inst_30 = v405.inst;
        return {
            bit32.band(bit32.rshift(l_inst_30, 16), 255), 
            (bit32.band(bit32.rshift(l_inst_30, 24), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_30, 8), 255))
        };
    end, 
    ORK = function(v407)
        local l_inst_31 = v407.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_31, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_31, 8), 255))
        };
    end, 
    CONCAT = function(v409)
        local l_inst_32 = v409.inst;
        local v411 = bit32.band(bit32.rshift(l_inst_32, 16), 255);
        local v412 = bit32.band(bit32.rshift(l_inst_32, 24), 255);
        local v413 = {};
        for v414 = v411, v412 do
            table.insert(v413, v414);
        end;
        return v413, {
            (bit32.band(bit32.rshift(l_inst_32, 8), 255))
        };
    end, 
    NOT = function(v415)
        local l_inst_33 = v415.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_33, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_33, 8), 255))
        };
    end, 
    MINUS = function(v417)
        local l_inst_34 = v417.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_34, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_34, 8), 255))
        };
    end, 
    LENGTH = function(v419)
        local l_inst_35 = v419.inst;
        return {
            (bit32.band(bit32.rshift(l_inst_35, 16), 255))
        }, {
            (bit32.band(bit32.rshift(l_inst_35, 8), 255))
        };
    end, 
    NATIVECALL = function(_)
        return {}, {};
    end, 
    BREAK = function(_)
        return {}, {};
    end, 
    NOP = function(_)
        return {}, {};
    end, 
    CAPTURE = function(v424)
        local l_inst_36 = v424.inst;
        if bit32.band(bit32.rshift(l_inst_36, 8), 255) ~= 2 then
            return {
                (bit32.band(bit32.rshift(l_inst_36, 16), 255))
            }, {};
        else
            return {}, {};
        end;
    end, 
    JUMPIF = function(v426)
        return {
            (bit32.band(bit32.rshift(v426.inst, 8), 255))
        }, {};
    end, 
    JUMPIFNOT = function(v427)
        return {
            (bit32.band(bit32.rshift(v427.inst, 8), 255))
        }, {};
    end, 
    JUMPIFEQ = function(v428)
        local l_aux_1 = v428.aux;
        assert(l_aux_1);
        return {
            bit32.band(bit32.rshift(v428.inst, 8), 255), 
            l_aux_1
        }, {};
    end, 
    JUMPIFLE = function(v430)
        local l_aux_2 = v430.aux;
        assert(l_aux_2);
        return {
            bit32.band(bit32.rshift(v430.inst, 8), 255), 
            l_aux_2
        }, {};
    end, 
    JUMPIFLT = function(v432)
        local l_aux_3 = v432.aux;
        assert(l_aux_3);
        return {
            bit32.band(bit32.rshift(v432.inst, 8), 255), 
            l_aux_3
        }, {};
    end, 
    JUMPIFNOTEQ = function(v434)
        local l_aux_4 = v434.aux;
        assert(l_aux_4);
        return {
            bit32.band(bit32.rshift(v434.inst, 8), 255), 
            l_aux_4
        }, {};
    end, 
    JUMPIFNOTLE = function(v436)
        local l_aux_5 = v436.aux;
        assert(l_aux_5);
        return {
            bit32.band(bit32.rshift(v436.inst, 8), 255), 
            l_aux_5
        }, {};
    end, 
    JUMPIFNOTLT = function(v438)
        local l_aux_6 = v438.aux;
        assert(l_aux_6);
        return {
            bit32.band(bit32.rshift(v438.inst, 8), 255), 
            l_aux_6
        }, {};
    end, 
    JUMPXEQKNIL = function(v440)
        return {
            (bit32.band(bit32.rshift(v440.inst, 8), 255))
        }, {};
    end, 
    JUMPXEQKB = function(v441)
        return {
            (bit32.band(bit32.rshift(v441.inst, 8), 255))
        }, {};
    end, 
    JUMPXEQKN = function(v442)
        return {
            (bit32.band(bit32.rshift(v442.inst, 8), 255))
        }, {};
    end, 
    JUMPXEQKS = function(v443)
        return {
            (bit32.band(bit32.rshift(v443.inst, 8), 255))
        }, {};
    end, 
    FORNPREP = function(v444)
        local v445 = bit32.band(bit32.rshift(v444.inst, 8), 255);
        return {
            v445, 
            v445 + 1, 
            v445 + 2
        }, {};
    end, 
    FORNLOOP = function(v446)
        local _ = bit32.band(bit32.rshift(v446.inst, 8), 255);
        return {}, {};
    end, 
    FORGPREP = function(v448)
        local v449 = bit32.band(bit32.rshift(v448.inst, 8), 255);
        return {
            v449, 
            v449 + 1, 
            v449 + 2
        }, {};
    end, 
    FORGPREP_NEXT = function(v450)
        local v451 = bit32.band(bit32.rshift(v450.inst, 8), 255);
        return {
            v451, 
            v451 + 1, 
            v451 + 2
        }, {};
    end, 
    FORGPREP_INEXT = function(v452)
        local v453 = bit32.band(bit32.rshift(v452.inst, 8), 255);
        return {
            v453, 
            v453 + 1, 
            v453 + 2
        }, {};
    end, 
    FORGLOOP = function(v454)
        local _ = bit32.band(bit32.rshift(v454.inst, 8), 255) + 2;
        local v456 = {};
        local v457 = 1;
        local l_aux_7 = v454.aux;
        assert(l_aux_7);
        for _ = v457, bit32.band(l_aux_7, 255) do

        end;
        return {}, v456;
    end
};
local l_v460_0 = v460 --[[ copy: 86 -> 108 ]];
do
    local l_v302_0 = v302;
    v301 = function(v463)
        local l_opname_0 = v463.opname;
        local v465 = l_v460_0[l_opname_0];
        if v465 then
            local v466, v467, v468 = v465(v463);
            local v469 = -1;
            for _, v471 in ipairs(v467) do
                if v469 < v471 then
                    v469 = v471;
                end;
            end;
            if v469 >= 0 and l_opname_0 ~= "NAMECALL" then
                l_v302_0 = v469;
            end;
            return v466, v467, v468;
        else
            error((("Unknown opname %*"):format(l_opname_0)));
            return;
        end;
    end;
end;
v302 = function(v472)
    local v473 = true;
    if v472 >= 32 then
        v473 = v472 > 126;
    end;
    return v473;
end;
v304 = function(v474)
    if v474 == 11 then
        return "\\v";
    elseif v474 == 10 then
        return "\\n";
    elseif v474 == 9 then
        return "\\t";
    elseif v474 == 7 then
        return "\\a";
    elseif v474 == 13 then
        return "\\r";
    elseif v474 == 12 then
        return "\\f";
    elseif v474 == 8 then
        return "\\b";
    else
        return "\\x" .. v64[v474];
    end;
end;
v460 = function(v475, v476, v477)
    if #v476 == 1 then
        local v478 = (not (v475 ~= "single char, single quotes") or v475 == "single quotes") and "'" or "\"";
        local v479 = string.byte(v476);
        local v480 = true;
        if v479 >= 32 then
            v480 = v479 > 126;
        end;
        if v480 then
            if v477 then
                return (v304(v479));
            else
                return v478 .. v304(v479) .. v478;
            end;
        elseif v476 == v478 then
            if v478 == "'" then
                if v477 then
                    return "'";
                else
                    return "\"'\"";
                end;
            elseif v477 then
                return "\"";
            else
                return "'\"'";
            end;
        elseif v476 == "\\" then
            if v477 then
                return "\\\\";
            elseif v478 == "'" then
                return "'\\\\'";
            else
                return "\"\\\\\"";
            end;
        elseif v477 then
            if v476 == "`" then
                return "\\`";
            else
                return v476;
            end;
        else
            return v478 .. v476 .. v478;
        end;
    elseif #v476 == 0 then
        if not (v475 ~= "double quotes") or v475 == "single char, single quotes" then
            if v477 then
                return "";
            else
                return "\"\"";
            end;
        elseif v477 then
            return "";
        else
            return "''";
        end;
    else
        local v481 = #v476;
        local v482 = false;
        local v483 = utf8.len(v476);
        if v483 then
            v482 = true;
            v481 = v483;
        end;
        local v484 = 0;
        local v485 = 0;
        local v486 = 0;
        local v487 = 0;
        local v488 = 0;
        local v489 = 0;
        local v490 = false;
        local v491 = buffer.fromstring(v476);
        if not v482 then
            for v492 = 0, v481 - 1 do
                local v493 = buffer.readu8(v491, v492);
                if v490 then
                    if v493 == 10 then
                        v484 = v484 + 1;
                    elseif v493 == 9 then
                        v485 = v485 + 1;
                        v486 = v486 + 1;
                    else
                        local v494 = true;
                        if v493 >= 32 then
                            v494 = v493 > 126;
                        end;
                        if v494 then
                            v488 = v488 + 1;
                            if v493 == 0 then
                                v489 = v489 + 1;
                            end;
                            v490 = false;
                        else
                            v487 = v487 + 1;
                            v490 = false;
                        end;
                    end;
                elseif v493 == 10 then
                    v484 = v484 + 1;
                    v490 = true;
                elseif v493 == 9 then
                    v485 = v485 + 1;
                    if v490 then
                        v486 = v486 + 1;
                    end;
                else
                    local v495 = true;
                    if v493 >= 32 then
                        v495 = v493 > 126;
                    end;
                    if v495 then
                        v488 = v488 + 1;
                        if v493 == 0 then
                            v489 = v489 + 1;
                        end;
                    else
                        v487 = v487 + 1;
                    end;
                end;
            end;
        end;
        if v488 / v481 > 0.4 then
            local v496 = (not (v475 ~= "single char, double quotes") or v475 == "single quotes") and 39 or 34;
            local v497 = 0;
            local v498 = buffer.create(if v477 then buffer.len(v491) * 4 else buffer.len(v491) * 4 + 2);
            if not v477 then
                buffer.writeu8(v498, 0, v496);
                v497 = v497 + 1;
            end;
            for v499 = 0, v481 - 1 do
                buffer.writeu32(v498, v497, v69[buffer.readu8(v491, v499)]);
                v497 = v497 + 4;
            end;
            if not v477 then
                buffer.writeu8(v498, v497, v496);
            end;
            return buffer.tostring(v498);
        else
            local v500 = (not (v475 ~= "single char, double quotes") or v475 == "single quotes") and "'" or "\"";
            local v501 = nil;
            local v502 = true;
            if v477 then
                v501 = "";
            elseif v484 > 1 then
                v502 = false;
                v501 = "[[";
            else
                v501 = v500;
            end;
            local v503 = nil;
            if v501 == "[[" then
                local v504 = false;
                while true do
                    v503 = string.gsub(v501, "%[", "]");
                    v504 = string.match(v476, v503) and true;
                    if v504 then
                        v501 = "[" .. string.rep("=", #v501 - 1) .. "[";
                    end;
                    if not v504 then
                        break;
                    end;
                end;
            else
                v503 = v501;
            end;
            local v505 = {
                v501
            };
            local v506 = "";
            local function v510(v507)
                local v508 = false;
                if v502 then
                    local v509 = true;
                    if v507 >= 32 then
                        v509 = v507 > 126;
                    end;
                    if v509 then
                        v506 = v506 .. v304(v507);
                        v508 = true;
                    end;
                end;
                if not v508 then
                    if v501 == v500 and v507 == string.byte(v500) then
                        v506 = v506 .. "\\\"";
                    elseif v477 and v507 == 96 then
                        v506 = v506 .. "\\`";
                    elseif v502 and v507 == 92 then
                        v506 = v506 .. "\\\\";
                    else
                        return false;
                    end;
                end;
                v508 = false;
                return true;
            end;
            local function _()
                if #v506 > 18 then
                    table.insert(v505, v506);
                    v506 = "";
                end;
            end;
            if v482 then
                for _, v513 in utf8.codes(v476) do
                    if not (v513 <= 255) or not v510(v513) then
                        v506 = v506 .. utf8.char(v513);
                    end;
                    if #v506 > 18 then
                        table.insert(v505, v506);
                        v506 = "";
                    end;
                end;
            else
                for v514 = 0, v481 - 1 do
                    local v515 = buffer.readu8(v491, v514);
                    if not v510(v515) then
                        v506 = v506 .. string.char(v515);
                    end;
                    if #v506 > 18 then
                        table.insert(v505, v506);
                        v506 = "";
                    end;
                end;
            end;
            if #v506 > 0 then
                table.insert(v505, v506);
            end;
            table.insert(v505, v503);
            local v516 = 0;
            for _, v518 in ipairs(v505) do
                v516 = v516 + #v518;
            end;
            local v519 = buffer.create(v516);
            local v520 = 0;
            for _, v522 in ipairs(v505) do
                buffer.writestring(v519, v520, v522);
                v520 = v520 + #v522;
            end;
            return buffer.tostring(v519);
        end;
    end;
end;
local v523 = nil;
local function v527(v524, v525)
    local v526 = math.abs(v524);
    if v526 == 3.141592653589793 then
        if v524 == 3.141592653589793 then
            return "math.pi";
        else
            return "(-math.pi)";
        end;
    elseif v526 == 1.5707963267948966 then
        if v524 == 1.5707963267948966 then
            return "(math.pi/2)";
        else
            return "(-math.pi/2)";
        end;
    elseif v526 == 6.283185307179586 then
        if v524 == 1.5707963267948966 then
            return "(math.pi*2)";
        else
            return "(-math.pi*2)";
        end;
    elseif v526 == 1e999 then
        if v524 == 1e999 then
            return "math.huge";
        else
            return "(-math.huge)";
        end;
    elseif v526 == 0.016666666666666666 then
        if v524 == 0.016666666666666666 then
            return "(1/60)";
        else
            return "(-1/60)";
        end;
    elseif v524 ~= v524 then
        if v523 then
            return "tonumber(\"nan\")";
        else
            return "(0/0)";
        end;
    elseif v525 then
        return (string.sub(tostring(v524), 1, 7));
    else
        return (tostring(v524));
    end;
end;
local v528 = {};
local v529 = {};
for v530 = 97, 122 do
    local v531 = string.char(v530);
    v528[v531] = true;
    v528[string.upper(v531)] = true;
    v529[string.byte(v531)] = true;
    v529[string.byte(string.upper(v531))] = true;
end;
v528._ = true;
v529[95] = true;
local v532 = table.clone(v528);
local v533 = table.clone(v529);
for v534 = 48, 57 do
    v532[string.char(v534)] = true;
    v533[v534] = true;
end;
local _ = {
    [" "] = true, 
    ["\t"] = true
};
local function v538(v536)
    if #v536 == 0 then
        return false;
    elseif not v528[string.sub(v536, 1, 1)] then
        return false;
    else
        for v537 = 2, #v536 do
            if not v532[string.sub(v536, v537, v537)] then
                return false;
            end;
        end;
        if v217[v536] then
            return false;
        else
            return true;
        end;
    end;
end;
local function v545(v539, v540, v541)
    if #v539 == 0 then
        return "";
    else
        local v542 = buffer.fromstring(v539);
        if not v540 and not v529[buffer.readu8(v542, 0)] then
            buffer.writeu8(v542, 0, 95);
        end;
        for v543 = 1, buffer.len(v542) - 1 do
            if not v533[buffer.readu8(v542, v543)] then
                buffer.writeu8(v542, v543, 95);
            end;
        end;
        local v544 = buffer.tostring(v542);
        if not v541 and v217[v544] then
            return v544 .. "_";
        else
            return v544;
        end;
    end;
end;
local function v550(v546, v547, v548)
    if not v546 then
        return "<INVALIDCONSTANT>";
    else
        local l_type_0 = v546.type;
        if l_type_0 == 2 then
            return (v527(v546.value));
        elseif l_type_0 == 3 then
            return v460(v547 or "double quotes", v546.value, v548);
        elseif l_type_0 == 7 then
            return "Vector3.new(" .. v527(v546.value.X, true) .. ", " .. v527(v546.value.Y, true) .. ", " .. v527(v546.value.Z, true) .. ")";
        elseif l_type_0 == 4 then
            return "<IMPORT>";
        elseif l_type_0 == 0 then
            return "nil";
        elseif l_type_0 == 1 then
            if v546.value then
                return "true";
            else
                return "false";
            end;
        else
            error((("Unknown const type %*"):format(l_type_0)));
            return;
        end;
    end;
end;
local v551 = nil;
local function v1121(v552)
    v551 = 0;
    local v553 = nil;
    v553 = if type(v552) == "buffer" then v552 else buffer.fromstring(v552);
    local v554, v555, v556, v557 = v296(v553);
    local v558 = l_clock_0();
    v27 = v558;
    local function _(v559)
        return string.rep("\t", #v559 + 1);
    end;
    local v561 = {};
    local v562 = "";
    local v563 = 0;
    local function _()
        v563 = v563 + 1;
        return v563;
    end;
    v523 = true;
    local function v565(v566, v567)
        if not v566 then
            v562 = v562 .. "--[[INVALIDPROTO]]";
            table.insert(v561, v562);
            v562 = "";
            return;
        else
            local v568 = v566 == v554;
            local v569 = buffer.create(8);
            local l_constants_0 = v566.constants;
            local l_protos_0 = v566.protos;
            if not v568 then
                table.insert(v561, v567 .. "local function " .. v566.debug_name .. "() -- Line " .. v566.line_defined .. "\n");
            end;
            local _ = string.rep("\t", #v567 + 1);
            local v573 = 0;
            local v574 = 0;
            local v575 = 0;
            local l_code_0 = v566.code;
            local v577 = #l_code_0;
            local function _()
                local v578 = l_code_0[v574];
                if v574 == v577 then
                    error("Corrupted aux");
                end;
                v574 = v574 + 1;
                return v578;
            end;
            local function v590(v580, v581)
                if v581 then
                    local l_v562_0 = v562;
                    local v583 = " [0x";
                    local v584 = l_code_0[v573];
                    local v585 = l_v562_0 .. v583 .. (v64[bit32.rshift(v584, 24)] .. v64[bit32.band(bit32.rrotate(v584, 16), 255)] .. v64[bit32.band(bit32.rrotate(v584, 8), 255)] .. v64[bit32.band(v584, 255)]) .. "] ";
                    v585 = (v585 .. string.rep(" ", #v567 + 28 - #v585) .. " ") .. v580;
                    l_v562_0 = string.rep(" ", #v567 + 62 - #v585) .. " ; ";
                    v583 = buffer.create(#v585 + #l_v562_0 + #v581 + 1);
                    buffer.writestring(v583, 0, v585);
                    local v586 = #v585;
                    buffer.writestring(v583, v586, l_v562_0);
                    v586 = v586 + #l_v562_0;
                    buffer.writestring(v583, v586, v581);
                    buffer.writeu8(v583, v586 + #v581, 10);
                    v562 = buffer.tostring(v583);
                    return;
                else
                    local l_v562_1 = v562;
                    local v588 = "[0x";
                    local v589 = l_code_0[v573];
                    v562 = l_v562_1 .. v588 .. (v64[bit32.rshift(v589, 24)] .. v64[bit32.band(bit32.rrotate(v589, 16), 255)] .. v64[bit32.band(bit32.rrotate(v589, 8), 255)] .. v64[bit32.band(v589, 255)]) .. "] " .. v580 .. "\n";
                    return;
                end;
            end;
            local function _()
                v562 = v567 .. "[" .. v574 - 1 .. "] #" .. v575;
            end;
            local v592 = {};
            local function _(v593, v594)
                local v595 = v592[v593];
                if v595 then
                    table.insert(v595, v574 - v594);
                    return;
                else
                    v592[v593] = {
                        v574 - v594
                    };
                    return;
                end;
            end;
            local v1101 = {
                NOP = function(_, _)
                    v590("NOP", "-- Do nothing");
                end, 
                BREAK = function(_, _)
                    v590("BREAK", "-- Stop execution for debugger");
                end, 
                LOADNIL = function(v601, _)
                    local v603 = bit32.band(bit32.rshift(v601, 8), 255);
                    v590("LOADNIL " .. v603, "var" .. v603 .. " = nil");
                end, 
                LOADB = function(v604, _)
                    local v606 = bit32.band(bit32.rshift(v604, 8), 255);
                    local v607 = bit32.band(bit32.rshift(v604, 16), 255);
                    local v608 = bit32.band(bit32.rshift(v604, 24), 255);
                    if v608 == 0 then
                        v590("LOADB " .. v606 .. ", " .. v607 .. ", " .. v608, "var" .. v606 .. " = " .. (v607 > 0 and "true" or "false"));
                        return;
                    else
                        local v609 = v574 + v608;
                        local v610 = v592[v609];
                        if v610 then
                            table.insert(v610, v574 - 1);
                        else
                            v592[v609] = {
                                v574 - 1
                            };
                        end;
                        v590("LOADB " .. v606 .. ", " .. v607 .. ", " .. v608, "var" .. v606 .. " = " .. (v607 > 0 and "true" or "false") .. " -- goto [" .. v609 .. "]");
                        return;
                    end;
                end, 
                LOADN = function(v611, _)
                    local v613 = bit32.band(bit32.rshift(v611, 8), 255);
                    buffer.writeu32(v569, 0, (bit32.band(bit32.rshift(v611, 16), 65535)));
                    local v614 = buffer.readi32(v569, 0);
                    v590("LOADN " .. v613 .. ", " .. v614, "var" .. v613 .. " = " .. v614);
                end, 
                LOADK = function(v615, _)
                    local v617 = bit32.band(bit32.rshift(v615, 8), 255);
                    local v618 = bit32.band(bit32.rshift(v615, 16), 65535);
                    v590("LOADK " .. v617 .. ", " .. v618, "var" .. v617 .. " = " .. v550(l_constants_0[v618]));
                end, 
                MOVE = function(v619, _)
                    local v621 = bit32.band(bit32.rshift(v619, 8), 255);
                    local v622 = bit32.band(bit32.rshift(v619, 16), 255);
                    v590("MOVE " .. v621 .. ", " .. v622, "var" .. v621 .. " = var" .. v622);
                end, 
                GETGLOBAL = function(v623, _)
                    local v625 = bit32.band(bit32.rshift(v623, 8), 255);
                    local v626 = bit32.band(bit32.rshift(v623, 24), 255);
                    local v627 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v627_0 = v627;
                    v627 = l_constants_0[l_v627_0];
                    if v627.type == 3 and v538(v627.value) and string.sub(v627.value, 1, 3) ~= "var" then
                        v590("GETGLOBAL " .. v625 .. ", " .. v626 .. " [" .. l_v627_0 .. "]", "var" .. v625 .. " = " .. v627.value);
                        return;
                    else
                        v590("GETGLOBAL " .. v625 .. ", " .. v626 .. " [" .. l_v627_0 .. "]", "var" .. v625 .. " = getfenv()[" .. v550(v627) .. "]");
                        return;
                    end;
                end, 
                SETGLOBAL = function(v629, _)
                    local v631 = bit32.band(bit32.rshift(v629, 8), 255);
                    local v632 = bit32.band(bit32.rshift(v629, 24), 255);
                    local v633 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v633_0 = v633;
                    v633 = l_constants_0[l_v633_0];
                    if v633.type == 3 and v538(v633.value) and string.sub(v633.value, 1, 3) ~= "var" then
                        v590("SETGLOBAL " .. v631 .. ", " .. v632 .. " [" .. l_v633_0 .. "]", v633.value .. " = var" .. v631);
                        return;
                    else
                        v590("SETGLOBAL " .. v631 .. ", " .. v632 .. " [" .. l_v633_0 .. "]", "getfenv()[" .. v550(v633) .. "] = var" .. v631);
                        return;
                    end;
                end, 
                GETUPVAL = function(v635, _)
                    local v637 = bit32.band(bit32.rshift(v635, 8), 255);
                    local v638 = bit32.band(bit32.rshift(v635, 16), 255);
                    v590("GETUPVAL " .. v637 .. ", " .. v638, "var" .. v637 .. " = " .. "up" .. v638);
                end, 
                SETUPVAL = function(v639, _)
                    local v641 = bit32.band(bit32.rshift(v639, 8), 255);
                    local v642 = bit32.band(bit32.rshift(v639, 16), 255);
                    v590("SETUPVAL " .. v641 .. ", " .. v642, "up" .. v642 .. " = var" .. v641);
                end, 
                CLOSEUPVALS = function(v643, _)
                    local v645 = bit32.band(bit32.rshift(v643, 8), 255);
                    v590("CLOSEUPVALS " .. v645, "move_upvalues_to_heap(var" .. v645 .. "->...)");
                end, 
                GETIMPORT = function(v646, _)
                    local v648 = bit32.band(bit32.rshift(v646, 8), 255);
                    local v649 = bit32.band(bit32.rshift(v646, 16), 65535);
                    local v650 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v650_0 = v650;
                    v650 = bit32.rrotate(bit32.band(l_v650_0, 3221225472), 30);
                    local v652 = l_constants_0[bit32.rrotate(bit32.band(l_v650_0, 1072693248), 20)];
                    if v650 == 2 then
                        local v653 = l_constants_0[bit32.rrotate(bit32.band(l_v650_0, 1047552), 10)];
                        local v654 = nil;
                        v654 = if v652.type == 3 and v538(v652.value) and string.sub(v652.value, 1, 3) ~= "var" then v652.value else "getfenv()[" .. v550(v652) .. "]";
                        v654 = if v653.type == 3 and v538(v653.value) and string.sub(v653.value, 1, 3) ~= "var" then v654 .. "." .. v653.value else v654 .. "[" .. v550(v653) .. "]";
                        v590("GETIMPORT " .. v648 .. ", " .. v649 .. " [0x" .. (v64[bit32.rshift(l_v650_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 8), 255)] .. v64[bit32.band(l_v650_0, 255)]) .. "]", "var" .. v648 .. " = " .. v654);
                        return;
                    elseif v650 == 3 then
                        local v655 = l_constants_0[bit32.rrotate(bit32.band(l_v650_0, 1047552), 10)];
                        local v656 = l_constants_0[bit32.band(l_v650_0, 1023)];
                        local v657 = nil;
                        v657 = if v652.type == 3 and v538(v652.value) and string.sub(v652.value, 1, 3) ~= "var" then v652.value else "getfenv()[" .. v550(v652) .. "]";
                        v657 = if v655.type == 3 and v538(v655.value) and string.sub(v655.value, 1, 3) ~= "var" then v657 .. "." .. v655.value else v657 .. "[" .. v550(v655) .. "]";
                        v657 = if v656.type == 3 and v538(v656.value) and string.sub(v656.value, 1, 3) ~= "var" then v657 .. "." .. v656.value else v657 .. "[" .. v550(v656) .. "]";
                        v590("GETIMPORT " .. v648 .. ", " .. v649 .. " [0x" .. (v64[bit32.rshift(l_v650_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 8), 255)] .. v64[bit32.band(l_v650_0, 255)]) .. "]", "var" .. v648 .. " = " .. v657);
                        return;
                    elseif v652.type == 3 and v538(v652.value) and string.sub(v652.value, 1, 3) ~= "var" then
                        v590("GETIMPORT " .. v648 .. ", " .. v649 .. " [0x" .. (v64[bit32.rshift(l_v650_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 8), 255)] .. v64[bit32.band(l_v650_0, 255)]) .. "]", "var" .. v648 .. " = " .. v652.value);
                        return;
                    else
                        v590("GETIMPORT " .. v648 .. ", " .. v649 .. " [0x" .. (v64[bit32.rshift(l_v650_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v650_0, 8), 255)] .. v64[bit32.band(l_v650_0, 255)]) .. "]", "var" .. v648 .. " = getfenv()[" .. v550(v652) .. "]");
                        return;
                    end;
                end, 
                GETTABLE = function(v658, _)
                    local v660 = bit32.band(bit32.rshift(v658, 8), 255);
                    local v661 = bit32.band(bit32.rshift(v658, 16), 255);
                    local v662 = bit32.band(bit32.rshift(v658, 24), 255);
                    v590("GETTABLE " .. v660 .. ", " .. v661 .. ", " .. v662, "var" .. v660 .. " = var" .. v661 .. "[var" .. v662 .. "]");
                end, 
                SETTABLE = function(v663, _)
                    local v665 = bit32.band(bit32.rshift(v663, 8), 255);
                    local v666 = bit32.band(bit32.rshift(v663, 16), 255);
                    local v667 = bit32.band(bit32.rshift(v663, 24), 255);
                    v590("SETTABLE " .. v665 .. ", " .. v666 .. ", " .. v667, "var" .. v666 .. "[var" .. v667 .. "] = var" .. v665);
                end, 
                GETTABLEKS = function(v668, _)
                    local v670 = bit32.band(bit32.rshift(v668, 8), 255);
                    local v671 = bit32.band(bit32.rshift(v668, 16), 255);
                    local v672 = bit32.band(bit32.rshift(v668, 24), 255);
                    local v673 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v673_0 = v673;
                    v673 = l_constants_0[l_v673_0];
                    if v673.type == 3 and v538(v673.value) then
                        v590("GETTABLEKS " .. v670 .. ", " .. v671 .. ", " .. v672 .. " [" .. l_v673_0 .. "]", "var" .. v670 .. " = var" .. v671 .. "." .. v673.value);
                        return;
                    else
                        v590("GETTABLEKS " .. v670 .. ", " .. v671 .. ", " .. v672 .. " [" .. l_v673_0 .. "]", "var" .. v670 .. " = var" .. v671 .. "[" .. v550(v673) .. "]");
                        return;
                    end;
                end, 
                SETTABLEKS = function(v675, _)
                    local v677 = bit32.band(bit32.rshift(v675, 8), 255);
                    local v678 = bit32.band(bit32.rshift(v675, 16), 255);
                    local v679 = bit32.band(bit32.rshift(v675, 24), 255);
                    local v680 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v680_0 = v680;
                    v680 = l_constants_0[l_v680_0];
                    if v680.type == 3 and v538(v680.value) then
                        v590("SETTABLEKS " .. v677 .. ", " .. v678 .. ", " .. v679 .. " [" .. l_v680_0 .. "]", "var" .. v678 .. "." .. v680.value .. " = var" .. v677);
                        return;
                    else
                        v590("SETTABLEKS " .. v677 .. ", " .. v678 .. ", " .. v679 .. " [" .. l_v680_0 .. "]", "var" .. v678 .. "[" .. v550(v680) .. "] = var" .. v677);
                        return;
                    end;
                end, 
                GETTABLEN = function(v682, _)
                    local v684 = bit32.band(bit32.rshift(v682, 8), 255);
                    local v685 = bit32.band(bit32.rshift(v682, 16), 255);
                    local v686 = bit32.band(bit32.rshift(v682, 24), 255);
                    v590("GETTABLEN " .. v684 .. ", " .. v685 .. ", " .. v686, "var" .. v684 .. " = var" .. v685 .. "[" .. v686 .. "]");
                end, 
                SETTABLEN = function(v687, _)
                    local v689 = bit32.band(bit32.rshift(v687, 8), 255);
                    local v690 = bit32.band(bit32.rshift(v687, 16), 255);
                    local v691 = bit32.band(bit32.rshift(v687, 24), 255);
                    v590("SETTABLEN " .. v689 .. ", " .. v690 .. ", " .. v691, "var" .. v690 .. "[" .. v691 .. "] = var" .. v689);
                end, 
                NAMECALL = function(v692, _)
                    local v694 = bit32.band(bit32.rshift(v692, 8), 255);
                    local v695 = bit32.band(bit32.rshift(v692, 16), 255);
                    local v696 = bit32.band(bit32.rshift(v692, 24), 255);
                    local v697 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v697_0 = v697;
                    v697 = l_constants_0[l_v697_0];
                    if v697.type == 3 and v538(v697.value) then
                        v590("NAMECALL " .. v694 .. ", " .. v695 .. ", " .. v696 .. " [" .. l_v697_0 .. "]", "var" .. v694 + 1 .. " = var" .. v695 .. "; var" .. v694 .. " = var" .. v695 .. "." .. v697.value .. " -- Invokes __namecall");
                        return;
                    else
                        v590("NAMECALL " .. v694 .. ", " .. v695 .. ", " .. v696 .. " [" .. l_v697_0 .. "]", "var" .. v694 + 1 .. " = var" .. v695 .. "; var" .. v694 .. " = var" .. v695 .. "[" .. v550(v697) .. "] -- Invokes __namecall");
                        return;
                    end;
                end, 
                CALL = function(v699, _)
                    local v701 = bit32.band(bit32.rshift(v699, 8), 255);
                    local v702 = bit32.band(bit32.rshift(v699, 16), 255);
                    local v703 = bit32.band(bit32.rshift(v699, 24), 255);
                    local v704 = v702 - 1;
                    local v705 = v703 - 1;
                    local v706 = nil;
                    if v704 == -1 then
                        v706 = {
                            "var" .. v701 + 1 .. "->(top)"
                        };
                    else
                        v706 = {};
                        for v707 = v701 + 1, v701 + v704 do
                            table.insert(v706, "var" .. v707);
                        end;
                    end;
                    if v705 == 0 then
                        v590("CALL " .. v701 .. ", " .. v702 .. ", " .. v703, "var" .. v701 .. "(" .. table.concat(v706, ", ") .. ")");
                        return;
                    else
                        local v708 = nil;
                        if v705 == -1 then
                            v708 = {
                                "var" .. v701 .. "->(top)"
                            };
                        else
                            v708 = {};
                            for v709 = v701, v701 + v705 - 1 do
                                table.insert(v708, "var" .. v709);
                            end;
                        end;
                        v590("CALL " .. v701 .. ", " .. v702 .. ", " .. v703, table.concat(v708, ", ") .. " = var" .. v701 .. "(" .. table.concat(v706, ", ") .. ")");
                        return;
                    end;
                end, 
                RETURN = function(v710, _)
                    local v712 = bit32.band(bit32.rshift(v710, 8), 255);
                    local v713 = bit32.band(bit32.rshift(v710, 16), 255);
                    local v714 = v713 - 1;
                    if v714 == 0 then
                        v590("RETURN " .. v712 .. ", " .. v713, "return");
                        return;
                    elseif v714 == -1 then
                        v590("RETURN " .. v712 .. ", " .. v713, "return var" .. v712 .. "->(top)");
                        return;
                    else
                        v590("RETURN " .. v712 .. ", " .. v713, "return var" .. v712 .. "->var" .. v712 + v714 - 1);
                        return;
                    end;
                end, 
                JUMP = function(v715, _)
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v715, 16), 65535)));
                    local v717 = buffer.readi16(v44, 0);
                    local v718 = v574 + v717;
                    local v719 = v592[v718];
                    if v719 then
                        table.insert(v719, v574 - 1);
                    else
                        v592[v718] = {
                            v574 - 1
                        };
                    end;
                    v590("JUMP " .. v717, "-- goto [" .. v718 .. "]");
                end, 
                JUMPBACK = function(v720, _)
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v720, 16), 65535)));
                    local v722 = buffer.readi16(v44, 0);
                    local v723 = v574 + v722;
                    local v724 = v592[v723];
                    if v724 then
                        table.insert(v724, v574 - 1);
                    else
                        v592[v723] = {
                            v574 - 1
                        };
                    end;
                    v590("JUMPBACK " .. v722, "-- goto [" .. v723 .. "] (likely while/repeat loop)");
                end, 
                JUMPIF = function(v725, _)
                    local v727 = bit32.band(bit32.rshift(v725, 8), 255);
                    local v728 = bit32.band(bit32.rshift(v725, 16), 65535);
                    local v729 = v574 + v728;
                    local v730 = v592[v729];
                    if v730 then
                        table.insert(v730, v574 - 1);
                    else
                        v592[v729] = {
                            v574 - 1
                        };
                    end;
                    v590("JUMPIF " .. v727 .. ", " .. v728, "if var" .. v727 .. " then goto [" .. v729 .. "] end");
                end, 
                JUMPIFNOT = function(v731, _)
                    local v733 = bit32.band(bit32.rshift(v731, 8), 255);
                    local v734 = bit32.band(bit32.rshift(v731, 16), 65535);
                    local v735 = v574 + v734;
                    local v736 = v592[v735];
                    if v736 then
                        table.insert(v736, v574 - 1);
                    else
                        v592[v735] = {
                            v574 - 1
                        };
                    end;
                    v590("JUMPIFNOT " .. v733 .. ", " .. v734, "if not var" .. v733 .. " then goto [" .. v735 .. "] end");
                end, 
                JUMPIFEQ = function(v737, _)
                    local v739 = bit32.band(bit32.rshift(v737, 8), 255);
                    local v740 = bit32.band(bit32.rshift(v737, 16), 65535);
                    local v741 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v741_0 = v741;
                    v741 = v574 - 1 + v740;
                    local v743 = v592[v741];
                    if v743 then
                        table.insert(v743, v574 - 2);
                    else
                        v592[v741] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPIFEQ " .. v739 .. ", " .. v740 .. " [" .. l_v741_0 .. "]", "if var" .. v739 .. " == var" .. l_v741_0 .. " then goto [" .. v741 .. "] end");
                end, 
                JUMPIFLE = function(v744, _)
                    local v746 = bit32.band(bit32.rshift(v744, 8), 255);
                    local v747 = bit32.band(bit32.rshift(v744, 16), 65535);
                    local v748 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v748_0 = v748;
                    v748 = v574 - 1 + v747;
                    local v750 = v592[v748];
                    if v750 then
                        table.insert(v750, v574 - 2);
                    else
                        v592[v748] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPIFLE " .. v746 .. ", " .. v747 .. " [" .. l_v748_0 .. "]", "if var" .. v746 .. " <= var" .. l_v748_0 .. " then goto [" .. v748 .. "] end");
                end, 
                JUMPIFLT = function(v751, _)
                    local v753 = bit32.band(bit32.rshift(v751, 8), 255);
                    local v754 = bit32.band(bit32.rshift(v751, 16), 65535);
                    local v755 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v755_0 = v755;
                    v755 = v574 - 1 + v754;
                    local v757 = v592[v755];
                    if v757 then
                        table.insert(v757, v574 - 2);
                    else
                        v592[v755] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPIFLT " .. v753 .. ", " .. v754 .. " [" .. l_v755_0 .. "]", "if var" .. v753 .. " < var" .. l_v755_0 .. " then goto [" .. v755 .. "] end");
                end, 
                JUMPIFNOTEQ = function(v758, _)
                    local v760 = bit32.band(bit32.rshift(v758, 8), 255);
                    local v761 = bit32.band(bit32.rshift(v758, 16), 65535);
                    local v762 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v762_0 = v762;
                    v762 = v574 - 1 + v761;
                    local v764 = v592[v762];
                    if v764 then
                        table.insert(v764, v574 - 2);
                    else
                        v592[v762] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPIFNOTEQ " .. v760 .. ", " .. v761 .. " [" .. l_v762_0 .. "]", "if var" .. v760 .. " ~= var" .. l_v762_0 .. " then goto [" .. v762 .. "] end");
                end, 
                JUMPIFNOTLE = function(v765, _)
                    local v767 = bit32.band(bit32.rshift(v765, 8), 255);
                    local v768 = bit32.band(bit32.rshift(v765, 16), 65535);
                    local v769 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v769_0 = v769;
                    v769 = v574 - 1 + v768;
                    local v771 = v592[v769];
                    if v771 then
                        table.insert(v771, v574 - 2);
                    else
                        v592[v769] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPIFNOTLE " .. v767 .. ", " .. v768 .. " [" .. l_v769_0 .. "]", "if var" .. v767 .. " > var" .. l_v769_0 .. " then goto [" .. v769 .. "] end");
                end, 
                JUMPIFNOTLT = function(v772, _)
                    local v774 = bit32.band(bit32.rshift(v772, 8), 255);
                    local v775 = bit32.band(bit32.rshift(v772, 16), 65535);
                    local v776 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v776_0 = v776;
                    v776 = v574 - 1 + v775;
                    local v778 = v592[v776];
                    if v778 then
                        table.insert(v778, v574 - 2);
                    else
                        v592[v776] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPIFNOTLT " .. v774 .. ", " .. v775 .. " [" .. l_v776_0 .. "]", "if var" .. v774 .. " >= var" .. l_v776_0 .. " then goto [" .. v776 .. "] end");
                end, 
                ADD = function(v779, _)
                    local v781 = bit32.band(bit32.rshift(v779, 8), 255);
                    local v782 = bit32.band(bit32.rshift(v779, 16), 255);
                    local v783 = bit32.band(bit32.rshift(v779, 24), 255);
                    if v781 == v782 then
                        v590("ADD " .. v781 .. ", " .. v782 .. ", " .. v783, "var" .. v781 .. " += var" .. v783);
                        return;
                    elseif v781 == v783 then
                        v590("ADD " .. v781 .. ", " .. v782 .. ", " .. v783, "var" .. v781 .. " += var" .. v782);
                        return;
                    else
                        v590("ADD " .. v781 .. ", " .. v782 .. ", " .. v783, "var" .. v781 .. " = var" .. v782 .. " + var" .. v783);
                        return;
                    end;
                end, 
                SUB = function(v784, _)
                    local v786 = bit32.band(bit32.rshift(v784, 8), 255);
                    local v787 = bit32.band(bit32.rshift(v784, 16), 255);
                    local v788 = bit32.band(bit32.rshift(v784, 24), 255);
                    if v786 == v787 then
                        v590("SUB " .. v786 .. ", " .. v787 .. ", " .. v788, "var" .. v786 .. " -= var" .. v788);
                        return;
                    else
                        v590("SUB " .. v786 .. ", " .. v787 .. ", " .. v788, "var" .. v786 .. " = var" .. v787 .. " - var" .. v788);
                        return;
                    end;
                end, 
                MUL = function(v789, _)
                    local v791 = bit32.band(bit32.rshift(v789, 8), 255);
                    local v792 = bit32.band(bit32.rshift(v789, 16), 255);
                    local v793 = bit32.band(bit32.rshift(v789, 24), 255);
                    if v791 == v792 then
                        v590("MUL " .. v791 .. ", " .. v792 .. ", " .. v793, "var" .. v791 .. " *= var" .. v793);
                        return;
                    elseif v791 == v793 then
                        v590("MUL " .. v791 .. ", " .. v792 .. ", " .. v793, "var" .. v791 .. " *= var" .. v792);
                        return;
                    else
                        v590("MUL " .. v791 .. ", " .. v792 .. ", " .. v793, "var" .. v791 .. " = var" .. v792 .. " * var" .. v793);
                        return;
                    end;
                end, 
                DIV = function(v794, _)
                    local v796 = bit32.band(bit32.rshift(v794, 8), 255);
                    local v797 = bit32.band(bit32.rshift(v794, 16), 255);
                    local v798 = bit32.band(bit32.rshift(v794, 24), 255);
                    if v796 == v797 then
                        v590("DIV " .. v796 .. ", " .. v797 .. ", " .. v798, "var" .. v796 .. " /= var" .. v798);
                        return;
                    else
                        v590("DIV " .. v796 .. ", " .. v797 .. ", " .. v798, "var" .. v796 .. " = var" .. v797 .. " / var" .. v798);
                        return;
                    end;
                end, 
                MOD = function(v799, _)
                    local v801 = bit32.band(bit32.rshift(v799, 8), 255);
                    local v802 = bit32.band(bit32.rshift(v799, 16), 255);
                    local v803 = bit32.band(bit32.rshift(v799, 24), 255);
                    if v801 == v802 then
                        v590("MOD " .. v801 .. ", " .. v802 .. ", " .. v803, "var" .. v801 .. " %= var" .. v803);
                        return;
                    else
                        v590("MOD " .. v801 .. ", " .. v802 .. ", " .. v803, "var" .. v801 .. " = var" .. v802 .. " % var" .. v803);
                        return;
                    end;
                end, 
                POW = function(v804, _)
                    local v806 = bit32.band(bit32.rshift(v804, 8), 255);
                    local v807 = bit32.band(bit32.rshift(v804, 16), 255);
                    local v808 = bit32.band(bit32.rshift(v804, 24), 255);
                    if v806 == v807 then
                        v590("POW " .. v806 .. ", " .. v807 .. ", " .. v808, "var" .. v806 .. " ^= var" .. v808);
                        return;
                    else
                        v590("POW " .. v806 .. ", " .. v807 .. ", " .. v808, "var" .. v806 .. " = var" .. v807 .. " ^ var" .. v808);
                        return;
                    end;
                end, 
                ADDK = function(v809, _)
                    local v811 = bit32.band(bit32.rshift(v809, 8), 255);
                    local v812 = bit32.band(bit32.rshift(v809, 16), 255);
                    local v813 = bit32.band(bit32.rshift(v809, 24), 255);
                    local v814 = l_constants_0[v813];
                    if v811 == v812 then
                        v590("ADDK " .. v811 .. ", " .. v812 .. ", " .. v813, "var" .. v811 .. " += " .. v550(v814));
                        return;
                    else
                        v590("ADDK " .. v811 .. ", " .. v812 .. ", " .. v813, "var" .. v811 .. " = var" .. v812 .. " + " .. v550(v814));
                        return;
                    end;
                end, 
                SUBK = function(v815, _)
                    local v817 = bit32.band(bit32.rshift(v815, 8), 255);
                    local v818 = bit32.band(bit32.rshift(v815, 16), 255);
                    local v819 = bit32.band(bit32.rshift(v815, 24), 255);
                    local v820 = l_constants_0[v819];
                    if v817 == v818 then
                        v590("SUBK " .. v817 .. ", " .. v818 .. ", " .. v819, "var" .. v817 .. " -= " .. v550(v820));
                        return;
                    else
                        v590("SUBK " .. v817 .. ", " .. v818 .. ", " .. v819, "var" .. v817 .. " = var" .. v818 .. " - " .. v550(v820));
                        return;
                    end;
                end, 
                MULK = function(v821, _)
                    local v823 = bit32.band(bit32.rshift(v821, 8), 255);
                    local v824 = bit32.band(bit32.rshift(v821, 16), 255);
                    local v825 = bit32.band(bit32.rshift(v821, 24), 255);
                    local v826 = l_constants_0[v825];
                    if v823 == v824 then
                        v590("MULK " .. v823 .. ", " .. v824 .. ", " .. v825, "var" .. v823 .. " *= " .. v550(v826));
                        return;
                    else
                        v590("MULK " .. v823 .. ", " .. v824 .. ", " .. v825, "var" .. v823 .. " = var" .. v824 .. " * " .. v550(v826));
                        return;
                    end;
                end, 
                DIVK = function(v827, _)
                    local v829 = bit32.band(bit32.rshift(v827, 8), 255);
                    local v830 = bit32.band(bit32.rshift(v827, 16), 255);
                    local v831 = bit32.band(bit32.rshift(v827, 24), 255);
                    local v832 = l_constants_0[v831];
                    if v829 == v830 then
                        v590("DIVK " .. v829 .. ", " .. v830 .. ", " .. v831, "var" .. v829 .. " /= " .. v550(v832));
                        return;
                    else
                        v590("DIVK " .. v829 .. ", " .. v830 .. ", " .. v831, "var" .. v829 .. " = var" .. v830 .. " / " .. v550(v832));
                        return;
                    end;
                end, 
                MODK = function(v833, _)
                    local v835 = bit32.band(bit32.rshift(v833, 8), 255);
                    local v836 = bit32.band(bit32.rshift(v833, 16), 255);
                    local v837 = bit32.band(bit32.rshift(v833, 24), 255);
                    local v838 = l_constants_0[v837];
                    if v835 == v836 then
                        v590("MODK " .. v835 .. ", " .. v836 .. ", " .. v837, "var" .. v835 .. " %= " .. v550(v838));
                        return;
                    else
                        v590("MODK " .. v835 .. ", " .. v836 .. ", " .. v837, "var" .. v835 .. " = var" .. v836 .. " % " .. v550(v838));
                        return;
                    end;
                end, 
                POWK = function(v839, _)
                    local v841 = bit32.band(bit32.rshift(v839, 8), 255);
                    local v842 = bit32.band(bit32.rshift(v839, 16), 255);
                    local v843 = bit32.band(bit32.rshift(v839, 24), 255);
                    local v844 = l_constants_0[v843];
                    if v841 == v842 then
                        v590("POWK " .. v841 .. ", " .. v842 .. ", " .. v843, "var" .. v841 .. " ^= " .. v550(v844));
                        return;
                    else
                        v590("POWK " .. v841 .. ", " .. v842 .. ", " .. v843, "var" .. v841 .. " = var" .. v842 .. " ^ " .. v550(v844));
                        return;
                    end;
                end, 
                AND = function(v845, _)
                    local v847 = bit32.band(bit32.rshift(v845, 8), 255);
                    local v848 = bit32.band(bit32.rshift(v845, 16), 255);
                    local v849 = bit32.band(bit32.rshift(v845, 24), 255);
                    v590("AND " .. v847 .. ", " .. v848 .. ", " .. v849, "var" .. v847 .. " = var" .. v848 .. " and var" .. v849);
                end, 
                OR = function(v850, _)
                    local v852 = bit32.band(bit32.rshift(v850, 8), 255);
                    local v853 = bit32.band(bit32.rshift(v850, 16), 255);
                    local v854 = bit32.band(bit32.rshift(v850, 24), 255);
                    v590("OR " .. v852 .. ", " .. v853 .. ", " .. v854, "var" .. v852 .. " = var" .. v853 .. " or var" .. v854);
                end, 
                ANDK = function(v855, _)
                    local v857 = bit32.band(bit32.rshift(v855, 8), 255);
                    local v858 = bit32.band(bit32.rshift(v855, 16), 255);
                    local v859 = bit32.band(bit32.rshift(v855, 24), 255);
                    local v860 = l_constants_0[v859];
                    v590("ANDK " .. v857 .. ", " .. v858 .. ", " .. v859, "var" .. v857 .. " = var" .. v858 .. " and " .. v550(v860));
                end, 
                ORK = function(v861, _)
                    local v863 = bit32.band(bit32.rshift(v861, 8), 255);
                    local v864 = bit32.band(bit32.rshift(v861, 16), 255);
                    local v865 = bit32.band(bit32.rshift(v861, 24), 255);
                    local v866 = l_constants_0[v865];
                    v590("ORK " .. v863 .. ", " .. v864 .. ", " .. v865, "var" .. v863 .. " = var" .. v864 .. " or " .. v550(v866));
                end, 
                CONCAT = function(v867, _)
                    local v869 = bit32.band(bit32.rshift(v867, 8), 255);
                    local v870 = bit32.band(bit32.rshift(v867, 16), 255);
                    local v871 = bit32.band(bit32.rshift(v867, 24), 255);
                    local v872 = {};
                    for v873 = v870, v871 do
                        table.insert(v872, "var" .. v873);
                    end;
                    if v869 == v870 and v870 <= v871 then
                        table.remove(v872, 1);
                        v590("CONCAT " .. v869 .. ", " .. v870 .. ", " .. v871, "var" .. v869 .. " ..= " .. table.concat(v872, ".."));
                        return;
                    else
                        v590("CONCAT " .. v869 .. ", " .. v870 .. ", " .. v871, "var" .. v869 .. " = " .. table.concat(v872, ".."));
                        return;
                    end;
                end, 
                NOT = function(v874, _)
                    local v876 = bit32.band(bit32.rshift(v874, 8), 255);
                    local v877 = bit32.band(bit32.rshift(v874, 16), 255);
                    v590("NOT " .. v876 .. ", " .. v877, "var" .. v876 .. " = not var" .. v877);
                end, 
                MINUS = function(v878, _)
                    local v880 = bit32.band(bit32.rshift(v878, 8), 255);
                    local v881 = bit32.band(bit32.rshift(v878, 16), 255);
                    v590("MINUS " .. v880 .. ", " .. v881, "var" .. v880 .. " = -var" .. v881);
                end, 
                LENGTH = function(v882, _)
                    local v884 = bit32.band(bit32.rshift(v882, 8), 255);
                    local v885 = bit32.band(bit32.rshift(v882, 16), 255);
                    v590("LENGTH " .. v884 .. ", " .. v885, "var" .. v884 .. " = #var" .. v885);
                end, 
                NEWTABLE = function(v886, _)
                    local v888 = bit32.band(bit32.rshift(v886, 8), 255);
                    local v889 = bit32.band(bit32.rshift(v886, 16), 255);
                    local _ = v889 == 0 and 0 or bit32.lrotate(1, v889 - 1);
                    local v891 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v891_0 = v891;
                    if l_v891_0 > 0 then
                        v590("NEWTABLE " .. v888 .. ", " .. v889 .. " [" .. l_v891_0 .. "]", "var" .. v888 .. " = table.create(" .. l_v891_0 .. ")");
                        return;
                    else
                        v590("NEWTABLE " .. v888 .. ", " .. v889 .. " [" .. l_v891_0 .. "]", "var" .. v888 .. " = {}");
                        return;
                    end;
                end, 
                DUPTABLE = function(v893, _)
                    local v895 = bit32.band(bit32.rshift(v893, 8), 255);
                    v590("DUPTABLE " .. v895 .. ", " .. bit32.band(bit32.rshift(v893, 16), 65535), "var" .. v895 .. " = {}");
                end, 
                SETLIST = function(v896, _)
                    local v898 = bit32.band(bit32.rshift(v896, 8), 255);
                    local v899 = bit32.band(bit32.rshift(v896, 16), 255);
                    local v900 = bit32.band(bit32.rshift(v896, 24), 255);
                    local v901 = v900 - 1;
                    local v902 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v902_0 = v902;
                    if v901 == -1 then
                        v590("SETLIST " .. v898 .. ", " .. v899 .. ", " .. v900 .. " [" .. l_v902_0 .. "]", "var" .. v898 .. "[" .. l_v902_0 .. "->(top)] = var" .. v899 .. "->(top)");
                        return;
                    else
                        v590("SETLIST " .. v898 .. ", " .. v899 .. ", " .. v900 .. " [" .. l_v902_0 .. "]", "var" .. v898 .. "[" .. l_v902_0 .. "->" .. l_v902_0 + v901 - 1 .. "] = var" .. v899 .. "->var" .. v899 + v901 - 1);
                        return;
                    end;
                end, 
                FORNPREP = function(v904, _)
                    local v906 = bit32.band(bit32.rshift(v904, 8), 255);
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v904, 16), 65535)));
                    local v907 = buffer.readi16(v44, 0);
                    local v908 = v574 + v907;
                    local v909 = v592[v908];
                    if v909 then
                        table.insert(v909, v574 - 1);
                    else
                        v592[v908] = {
                            v574 - 1
                        };
                    end;
                    v590("FORNPREP " .. v906 .. ", " .. v907, "for var" .. v906 + 2 .. " = var" .. v906 + 2 .. ", var" .. v906 .. ", var" .. v906 + 1 .. " do -- If loop shouldn't start (var" .. v906 + 2 .. " > var" .. v906 .. ") then goto [" .. v908 .. "]");
                end, 
                FORNLOOP = function(v910, _)
                    local v912 = bit32.band(bit32.rshift(v910, 8), 255);
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v910, 16), 65535)));
                    local v913 = buffer.readi16(v44, 0);
                    local v914 = v574 + v913;
                    local v915 = v592[v914];
                    if v915 then
                        table.insert(v915, v574 - 1);
                    else
                        v592[v914] = {
                            v574 - 1
                        };
                    end;
                    v590("FORNLOOP " .. v912 .. ", " .. v913, "var" .. v912 + 2 .. " += var" .. v912 + 1 .. "; if var" .. v912 + 2 .. " <= var" .. v912 .. " then goto [" .. v914 .. "] end");
                end, 
                FORGLOOP = function(v916, _)
                    local v918 = bit32.band(bit32.rshift(v916, 8), 255);
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v916, 16), 65535)));
                    local v919 = buffer.readi16(v44, 0);
                    local v920 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v920_0 = v920;
                    v920 = bit32.band(l_v920_0, 255);
                    local v922 = table.create(v920);
                    for v923 = 1, v920 do
                        table.insert(v922, "var" .. v918 + 2 + v923);
                    end;
                    local v924 = v574 + v919 - 1;
                    local v925 = v592[v924];
                    if v925 then
                        table.insert(v925, v574 - 2);
                    else
                        v592[v924] = {
                            v574 - 2
                        };
                    end;
                    if bit32.band(l_v920_0, 2147483648) > 0 then
                        v590("FORGLOOP " .. v918 .. ", " .. v919 .. " [0x" .. (v64[bit32.rshift(l_v920_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v920_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v920_0, 8), 255)] .. v64[bit32.band(l_v920_0, 255)]) .. "]", table.concat(v922, ", ") .. " = var" .. v918 .. "(var" .. v918 + 1 .. ", var" .. v918 + 2 .. "); if var" .. v918 + 3 .. " ~= nil then goto [" .. v924 .. "]");
                        return;
                    else
                        v590("FORGLOOP " .. v918 .. ", " .. v919 .. " [0x" .. (v64[bit32.rshift(l_v920_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v920_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v920_0, 8), 255)] .. v64[bit32.band(l_v920_0, 255)]) .. "]", table.concat(v922, ", ") .. " = var" .. v918 .. "(var" .. v918 + 1 .. ", var" .. v918 + 2 .. "); if var" .. v918 + 3 .. " ~= nil then goto [" .. v924 .. "]");
                        return;
                    end;
                end, 
                FORGPREP = function(v926, _)
                    local v928 = bit32.band(bit32.rshift(v926, 8), 255);
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v926, 16), 65535)));
                    local v929 = buffer.readi16(v44, 0);
                    local v930 = v574 + v929;
                    local v931 = v592[v930];
                    if v931 then
                        table.insert(v931, v574 - 1);
                    else
                        v592[v930] = {
                            v574 - 1
                        };
                    end;
                    v590("FORGPREP " .. v928 .. ", " .. v929, "for var" .. v928 + 3 .. "->... in var" .. v928 .. ", var" .. v928 + 1 .. ", var" .. v928 + 2 .. " do -- If loop shouldn't start then goto [" .. v930 .. "]");
                end, 
                FORGPREP_INEXT = function(v932, _)
                    local v934 = bit32.band(bit32.rshift(v932, 8), 255);
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v932, 16), 65535)));
                    local v935 = buffer.readi16(v44, 0);
                    local v936 = v574 + v935;
                    local v937 = v592[v936];
                    if v937 then
                        table.insert(v937, v574 - 1);
                    else
                        v592[v936] = {
                            v574 - 1
                        };
                    end;
                    v590("FORGPREP_INEXT " .. v934 .. ", " .. v935, "for var" .. v934 + 3 .. "->... in var" .. v934 .. ", var" .. v934 + 1 .. ", var" .. v934 + 2 .. " do -- If loop shouldn't start then goto [" .. v936 .. "]");
                end, 
                DEP_FORGLOOP_INEXT = function(_, _)
                    v590("DEP_FORGLOOP_INEXT", "-- Deprecated instruction, send me some bytecode that has this and I'll support it");
                end, 
                FORGPREP_NEXT = function(v940, _)
                    local v942 = bit32.band(bit32.rshift(v940, 8), 255);
                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v940, 16), 65535)));
                    local v943 = buffer.readi16(v44, 0);
                    local v944 = v574 + v943;
                    local v945 = v592[v944];
                    if v945 then
                        table.insert(v945, v574 - 1);
                    else
                        v592[v944] = {
                            v574 - 1
                        };
                    end;
                    v590("FORGPREP_NEXT " .. v942 .. ", " .. v943, "for var" .. v942 + 3 .. "->... in var" .. v942 .. ", var" .. v942 + 1 .. ", var" .. v942 + 2 .. " do -- If loop shouldn't start then goto [" .. v944 .. "]");
                end, 
                NATIVECALL = function(_, _)
                    v590("NATIVECALL", "-- Call to native code");
                end, 
                GETVARARGS = function(v948, _)
                    local v950 = bit32.band(bit32.rshift(v948, 8), 255);
                    local v951 = bit32.band(bit32.rshift(v948, 16), 255);
                    local v952 = v951 - 1;
                    if v952 == 0 then
                        v590("GETVARARGS " .. v950 .. ", " .. v951, "var" .. v950 .. " = ... -- No variables");
                        return;
                    elseif v952 == -1 then
                        if v950 == 1 then
                            v590("GETVARARGS " .. v950 .. ", " .. v951, "var" .. v950 .. "->(top) = ... -- Load (top) variables");
                            return;
                        else
                            v590("GETVARARGS " .. v950 .. ", " .. v951, "var" .. v950 .. "->(top) = ... -- Load (top) - " .. v950 - 1 .. " variables");
                            return;
                        end;
                    else
                        v590("GETVARARGS " .. v950 .. ", " .. v951, "var" .. v950 .. " = ... -- Load " .. v952 .. " variable" .. (v952 == 1 and "" or "s"));
                        return;
                    end;
                end, 
                NEWCLOSURE = function(v953, v954)
                    local v955 = bit32.band(bit32.rshift(v953, 8), 255);
                    local v956 = bit32.band(bit32.rshift(v953, 16), 65535);
                    local v957 = l_protos_0[v956];
                    local _ = v562;
                    local l_debug_name_0 = v957.debug_name;
                    if not l_debug_name_0 then
                        local v960 = "func";
                        v563 = v563 + 1;
                        l_debug_name_0 = v960 .. v563;
                    end;
                    v957.debug_name = l_debug_name_0;
                    v565(v957, v954);
                    table.insert(v561, v562);
                    v562 = v567 .. "[" .. v574 - 1 .. "] #" .. v575;
                    v590("NEWCLOSURE " .. v955 .. ", " .. v956, "var" .. v955 .. " = " .. v957.debug_name);
                    l_debug_name_0 = 0;
                    while true do
                        local v961 = l_code_0[v574];
                        if v961 and v181[bit32.band(v961, 255)].opname == "CAPTURE" then
                            table.insert(v561, v562);
                            v562 = v567 .. "[" .. v574 - 1 .. "] #" .. v575;
                            local v962 = bit32.band(bit32.rshift(v961, 8), 255);
                            local v963 = bit32.band(bit32.rshift(v961, 16), 255);
                            if v962 == 0 then
                                v590("CAPTURE " .. v962 .. ", " .. v963, "up" .. l_debug_name_0 .. " = var" .. v963 .. " -- Readable");
                            elseif v962 == 1 then
                                v590("CAPTURE " .. v962 .. ", " .. v963, "up" .. l_debug_name_0 .. " = var" .. v963 .. " -- Readable and writable");
                            elseif v962 == 2 then
                                v590("CAPTURE " .. v962 .. ", " .. v963, "up" .. l_debug_name_0 .. " = up" .. v963);
                            else
                                v590("CAPTURE " .. v962 .. ", " .. v963, "up" .. l_debug_name_0 .. " = ??? -- Invalid capture type");
                            end;
                            v574 = v574 + 1;
                            l_debug_name_0 = l_debug_name_0 + 1;
                        else
                            break;
                        end;
                    end;
                end, 
                DUPCLOSURE = function(v964, v965)
                    local v966 = false;
                    local v967 = bit32.band(bit32.rshift(v964, 8), 255);
                    local v968 = bit32.band(bit32.rshift(v964, 16), 65535);
                    local v969 = l_constants_0[v968];
                    local v970 = v555[v969.value] or {
                        debug_name = ("INVALIDPROTO<%*>%*"):format(v24[v969.type] or "NONE", v969.value), 
                        params_count = 0, 
                        line_defined = -1, 
                        stack_size = 0, 
                        type_info = {}, 
                        upvalues_count = 0, 
                        is_vararg = false, 
                        protos = {}, 
                        constants = {}, 
                        flags = 0, 
                        code = {}, 
                        line_info = {}, 
                        abs_line_info = {}
                    };
                    local _ = v562;
                    local v972, v973;
                    if v970 then
                        v973 = v970.debug_name;
                        v966 = v973;
                    end;
                    if not v966 then
                        v972 = "func";
                        v563 = v563 + 1;
                        v973 = v972 .. v563;
                    end;
                    v966 = false;
                    v970.debug_name = v973;
                    v565(v970, v965);
                    table.insert(v561, v562);
                    v562 = v567 .. "[" .. v574 - 1 .. "] #" .. v575;
                    v590("DUPCLOSURE " .. v967 .. ", " .. v968, "var" .. v967 .. " = " .. v970.debug_name);
                    v973 = 0;
                    while true do
                        v972 = l_code_0[v574];
                        if v972 and v181[bit32.band(v972, 255)].opname == "CAPTURE" then
                            table.insert(v561, v562);
                            v562 = v567 .. "[" .. v574 - 1 .. "] #" .. v575;
                            local v974 = bit32.band(bit32.rshift(v972, 8), 255);
                            local v975 = bit32.band(bit32.rshift(v972, 16), 255);
                            if v974 == 0 then
                                v590("CAPTURE " .. v974 .. ", " .. v975, "up" .. v973 .. " = var" .. v975 .. " -- Readable");
                            elseif v974 == 1 then
                                v590("CAPTURE " .. v974 .. ", " .. v975, "up" .. v973 .. " = var" .. v975 .. " -- Readable and writable");
                            elseif v974 == 2 then
                                v590("CAPTURE " .. v974 .. ", " .. v975, "up" .. v973 .. " = up" .. v975);
                            else
                                v590("CAPTURE " .. v974 .. ", " .. v975, "up" .. v973 .. " = ??? -- Invalid capture type");
                            end;
                            v574 = v574 + 1;
                            v973 = v973 + 1;
                        else
                            break;
                        end;
                    end;
                end, 
                PREPVARARGS = function(v976, _)
                    local v978 = bit32.band(bit32.rshift(v976, 8), 255);
                    local v979 = v978 - 1;
                    if v979 == 0 then
                        v590("PREPVARARGS " .. v978, "-- No varargs");
                        return;
                    elseif v979 == -1 then
                        v590("PREPVARARGS " .. v978, "-- Prepare for any number (top) of variables as ...");
                        return;
                    else
                        v590("PREPVARARGS " .. v978, "-- Prepare for " .. v979 .. " variables as ...");
                        return;
                    end;
                end, 
                LOADKX = function(v980, _)
                    local v982 = bit32.band(bit32.rshift(v980, 8), 255);
                    local v983 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v983_0 = v983;
                    v590("LOADK " .. v982 .. " [" .. l_v983_0 .. "]", "var" .. v982 .. " = " .. v550(l_constants_0[l_v983_0]));
                end, 
                JUMPX = function(v985, _)
                    buffer.writeu32(v44, 0, (bit32.rshift(v985, 8)));
                    local v987 = bit32.rshift(buffer.readi32(v44, 1), 16);
                    local v988 = v574 + v987;
                    local v989 = v592[v988];
                    if v989 then
                        table.insert(v989, v574 - 1);
                    else
                        v592[v988] = {
                            v574 - 1
                        };
                    end;
                    v590("JUMPX " .. v987, "-- goto [" .. v988 .. "]");
                end, 
                COVERAGE = function(v990, _)
                    v590("COVERAGE " .. bit32.rshift(v990, 8), "instruction_hits[" .. v573 .. "] += 1");
                end, 
                CAPTURE = function(v992, _)
                    v590("CAPTURE " .. bit32.band(bit32.rshift(v992, 8), 255) .. ", " .. bit32.band(bit32.rshift(v992, 16), 255), "-- Should not exist here, but equivelant to NOP");
                end, 
                SUBRK = function(v994, _)
                    local v996 = bit32.band(bit32.rshift(v994, 8), 255);
                    local v997 = bit32.band(bit32.rshift(v994, 16), 255);
                    local v998 = bit32.band(bit32.rshift(v994, 24), 255);
                    local v999 = l_constants_0[v997];
                    v590("SUBRK " .. v996 .. ", " .. v997 .. ", " .. v998, "var" .. v996 .. " = " .. v550(v999) .. " - var" .. v998);
                end, 
                DIVRK = function(v1000, _)
                    local v1002 = bit32.band(bit32.rshift(v1000, 8), 255);
                    local v1003 = bit32.band(bit32.rshift(v1000, 16), 255);
                    local v1004 = bit32.band(bit32.rshift(v1000, 24), 255);
                    local v1005 = l_constants_0[v1003];
                    v590("DIVRK " .. v1002 .. ", " .. v1003 .. ", " .. v1004, "var" .. v1002 .. " = " .. v550(v1005) .. " // var" .. v1004);
                end, 
                FASTCALL = function(v1006, _)
                    local v1008 = bit32.band(bit32.rshift(v1006, 8), 255);
                    local v1009 = bit32.band(bit32.rshift(v1006, 24), 255);
                    local v1010 = v220[v1008] or "<invalid>";
                    local v1011 = v574 + v1009;
                    local v1012 = v1011 + 1;
                    local v1013 = v592[v1012];
                    if v1013 then
                        table.insert(v1013, v574 - 1);
                    else
                        v592[v1012] = {
                            v574 - 1
                        };
                    end;
                    v590("FASTCALL " .. v1008 .. ", " .. v1009, "... = " .. v1010 .. "(...) -- Uses args and results from call at [" .. v1011 .. "]. If successful, goto [" .. v1011 + 1 .. "]");
                end, 
                FASTCALL1 = function(v1014, _)
                    local v1016 = bit32.band(bit32.rshift(v1014, 8), 255);
                    local v1017 = bit32.band(bit32.rshift(v1014, 16), 255);
                    local v1018 = bit32.band(bit32.rshift(v1014, 24), 255);
                    local v1019 = v220[v1016] or "<invalid>";
                    local v1020 = v574 + v1018;
                    local v1021 = v1020 + 1;
                    local v1022 = v592[v1021];
                    if v1022 then
                        table.insert(v1022, v574 - 1);
                    else
                        v592[v1021] = {
                            v574 - 1
                        };
                    end;
                    v590("FASTCALL1 " .. v1016 .. ", " .. v1017 .. ", " .. v1018, "... = " .. v1019 .. "(var" .. v1017 .. ") -- Uses results from call at [" .. v1020 .. "]. If successful, goto [" .. v1020 + 1 .. "]");
                end, 
                FASTCALL2 = function(v1023, _)
                    local v1025 = bit32.band(bit32.rshift(v1023, 8), 255);
                    local v1026 = bit32.band(bit32.rshift(v1023, 16), 255);
                    local v1027 = bit32.band(bit32.rshift(v1023, 24), 255);
                    local v1028 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    v1028 = bit32.band(v1028, 255);
                    local v1029 = v220[v1025] or "<invalid>";
                    local v1030 = v574 + v1027 - 1;
                    local v1031 = v1030 + 1;
                    local v1032 = v592[v1031];
                    if v1032 then
                        table.insert(v1032, v574 - 1);
                    else
                        v592[v1031] = {
                            v574 - 1
                        };
                    end;
                    v590("FASTCALL2 " .. v1025 .. ", " .. v1026 .. ", " .. v1027, "... = " .. v1029 .. "(var" .. v1026 .. ", var" .. v1028 .. ") -- Uses results from call at [" .. v1030 .. "]. If successful, goto [" .. v1030 + 1 .. "]");
                end, 
                FASTCALL2K = function(v1033, _)
                    local v1035 = bit32.band(bit32.rshift(v1033, 8), 255);
                    local v1036 = bit32.band(bit32.rshift(v1033, 16), 255);
                    local v1037 = bit32.band(bit32.rshift(v1033, 24), 255);
                    local v1038 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v1038_0 = v1038;
                    v1038 = l_constants_0[l_v1038_0];
                    local v1040 = v220[v1035] or "<invalid>";
                    local v1041 = v574 + v1037 - 1;
                    local v1042 = v1041 + 1;
                    local v1043 = v592[v1042];
                    if v1043 then
                        table.insert(v1043, v574 - 1);
                    else
                        v592[v1042] = {
                            v574 - 1
                        };
                    end;
                    v590("FASTCALL2K " .. v1035 .. ", " .. v1036 .. ", " .. v1037 .. " [" .. l_v1038_0 .. "]", "... = " .. v1040 .. "(var" .. v1036 .. ", " .. v550(v1038) .. ") -- Uses results from call at [" .. v1041 .. "]. If successful, goto [" .. v1041 + 1 .. "]");
                end, 
                FASTCALL3 = function(v1044, _)
                    local v1046 = bit32.band(bit32.rshift(v1044, 8), 255);
                    local v1047 = bit32.band(bit32.rshift(v1044, 16), 255);
                    local v1048 = bit32.band(bit32.rshift(v1044, 24), 255);
                    local v1049 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v1049_0 = v1049;
                    v1049 = bit32.band(l_v1049_0, 255);
                    local v1051 = bit32.rshift(bit32.band(l_v1049_0, 65280), 8);
                    local v1052 = v220[v1046] or "<invalid>";
                    local v1053 = v574 + v1048 - 1;
                    local v1054 = v1053 + 1;
                    local v1055 = v592[v1054];
                    if v1055 then
                        table.insert(v1055, v574 - 1);
                    else
                        v592[v1054] = {
                            v574 - 1
                        };
                    end;
                    v590("FASTCALL3 " .. v1046 .. ", " .. v1047 .. ", " .. v1048, "... = " .. v1052 .. "(var" .. v1047 .. ", var" .. v1049 .. ", var" .. v1051 .. ") -- Uses results from call at [" .. v1053 .. "]. If successful, goto [" .. v1053 + 1 .. "]");
                end, 
                JUMPXEQKNIL = function(v1056, _)
                    local v1058 = bit32.band(bit32.rshift(v1056, 8), 255);
                    local v1059 = bit32.band(bit32.rshift(v1056, 16), 65535);
                    local v1060 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v1060_0 = v1060;
                    v1060 = false;
                    if bit32.band(l_v1060_0, 2147483648) > 0 then
                        v1060 = true;
                    end;
                    local v1062 = v574 - 1 + v1059;
                    local v1063 = v592[v1062];
                    if v1063 then
                        table.insert(v1063, v574 - 2);
                    else
                        v592[v1062] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPXEQKNIL " .. v1058 .. ", " .. v1059 .. " [0x" .. (v64[bit32.rshift(l_v1060_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v1060_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v1060_0, 8), 255)] .. v64[bit32.band(l_v1060_0, 255)]) .. "]", "if var" .. v1058 .. " " .. (v1060 and "~" or "=") .. "= nil then goto [" .. v1062 .. "] end");
                end, 
                JUMPXEQKB = function(v1064, _)
                    local v1066 = bit32.band(bit32.rshift(v1064, 8), 255);
                    local v1067 = bit32.band(bit32.rshift(v1064, 16), 65535);
                    local v1068 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v1068_0 = v1068;
                    v1068 = false;
                    if bit32.band(l_v1068_0, 2147483648) > 0 then
                        v1068 = true;
                    end;
                    local v1070 = v574 - 1 + v1067;
                    local v1071 = v592[v1070];
                    if v1071 then
                        table.insert(v1071, v574 - 2);
                    else
                        v592[v1070] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPXEQKB " .. v1066 .. ", " .. v1067 .. " [0x" .. (v64[bit32.rshift(l_v1068_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v1068_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v1068_0, 8), 255)] .. v64[bit32.band(l_v1068_0, 255)]) .. "]", "if var" .. v1066 .. " " .. (v1068 and "~" or "=") .. "= " .. (bit32.band(l_v1068_0, 1) == 0 and "false" or "true") .. " then goto [" .. v1070 .. "] end");
                end, 
                JUMPXEQKN = function(v1072, _)
                    local v1074 = bit32.band(bit32.rshift(v1072, 8), 255);
                    local v1075 = bit32.band(bit32.rshift(v1072, 16), 65535);
                    local v1076 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v1076_0 = v1076;
                    v1076 = false;
                    if bit32.band(l_v1076_0, 2147483648) > 0 then
                        v1076 = true;
                    end;
                    local v1078 = l_constants_0[bit32.band(l_v1076_0, 16777215)];
                    local v1079 = v574 - 1 + v1075;
                    local v1080 = v592[v1079];
                    if v1080 then
                        table.insert(v1080, v574 - 2);
                    else
                        v592[v1079] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPXEQKN " .. v1074 .. ", " .. v1075 .. " [0x" .. (v64[bit32.rshift(l_v1076_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v1076_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v1076_0, 8), 255)] .. v64[bit32.band(l_v1076_0, 255)]) .. "]", "if var" .. v1074 .. " " .. (v1076 and "~" or "=") .. "= " .. v550(v1078) .. " then goto [" .. v1079 .. "] end");
                end, 
                JUMPXEQKS = function(v1081, _)
                    local v1083 = bit32.band(bit32.rshift(v1081, 8), 255);
                    local v1084 = bit32.band(bit32.rshift(v1081, 16), 65535);
                    local v1085 = l_code_0[v574];
                    if v574 == v577 then
                        error("Corrupted aux");
                    end;
                    v574 = v574 + 1;
                    local l_v1085_0 = v1085;
                    v1085 = false;
                    if bit32.band(l_v1085_0, 2147483648) > 0 then
                        v1085 = true;
                    end;
                    local v1087 = l_constants_0[bit32.band(l_v1085_0, 16777215)];
                    local v1088 = v574 - 1 + v1084;
                    local v1089 = v592[v1088];
                    if v1089 then
                        table.insert(v1089, v574 - 2);
                    else
                        v592[v1088] = {
                            v574 - 2
                        };
                    end;
                    v590("JUMPXEQKS " .. v1083 .. ", " .. v1084 .. " [0x" .. (v64[bit32.rshift(l_v1085_0, 24)] .. v64[bit32.band(bit32.rrotate(l_v1085_0, 16), 255)] .. v64[bit32.band(bit32.rrotate(l_v1085_0, 8), 255)] .. v64[bit32.band(l_v1085_0, 255)]) .. "]", "if var" .. v1083 .. " " .. (v1085 and "~" or "=") .. "= " .. v550(v1087) .. " then goto [" .. v1088 .. "] end");
                end, 
                IDIV = function(v1090, _)
                    local v1092 = bit32.band(bit32.rshift(v1090, 8), 255);
                    local v1093 = bit32.band(bit32.rshift(v1090, 16), 255);
                    local v1094 = bit32.band(bit32.rshift(v1090, 24), 255);
                    if v1092 == v1093 then
                        v590("IDIV " .. v1092 .. ", " .. v1093 .. ", " .. v1094, "var" .. v1092 .. " //= var" .. v1094);
                        return;
                    else
                        v590("IDIV " .. v1092 .. ", " .. v1093 .. ", " .. v1094, "var" .. v1092 .. " = var" .. v1093 .. " // var" .. v1094);
                        return;
                    end;
                end, 
                IDIVK = function(v1095, _)
                    local v1097 = bit32.band(bit32.rshift(v1095, 8), 255);
                    local v1098 = bit32.band(bit32.rshift(v1095, 16), 255);
                    local v1099 = bit32.band(bit32.rshift(v1095, 24), 255);
                    local v1100 = l_constants_0[v1099];
                    if v1097 == v1098 then
                        v590("IDIVK " .. v1097 .. ", " .. v1098 .. ", " .. v1099, "var" .. v1097 .. " //= " .. v550(v1100));
                        return;
                    else
                        v590("IDIVK " .. v1097 .. ", " .. v1098 .. ", " .. v1099, "var" .. v1097 .. " = var" .. v1098 .. " // " .. v550(v1100));
                        return;
                    end;
                end
            };
            local v1102 = {};
            for v1103, v1104 in pairs(v1101) do
                if v180[v1103] then
                    local v1105 = v180[v1103];
                    if not v1105 then
                        error((("Unknown opname %*"):format(v1103)));
                    end;
                    v1102[v1105.opcode] = v1104;
                end;
            end;
            local v1106 = {};
            local l_v567_0 = v567;
            if not v568 then
                local l_v567_1 = v567;
                v567 = string.rep("\t", #l_v567_1 + 1);
            end;
            if v577 > 0 then
                while v574 <= v577 do
                    local v1109 = l_code_0[v574];
                    v573 = v574;
                    v574 = v574 + 1;
                    v575 = v575 + 1;
                    local v1110 = v1102[bit32.band(v1109, 255)];
                    if v1110 then
                        v562 = v567 .. "[" .. v574 - 1 .. "] #" .. v575;
                        v1110(v1109, v567);
                        table.insert(v561, v562);
                        v1106[v562] = v573;
                    else
                        table.insert(v561, (("%*; Unknown opcode 0x%* (%* reversed: 0x%*)\n"):format(v567, v64[bit32.band(v1109, 255)], v16, v64[v17[bit32.band(v1109, 255)]])));
                        v551 = v551 + 1;
                    end;
                end;
            end;
            v562 = "";
            v567 = l_v567_0;
            for v1111, v1112 in ipairs(v561) do
                local v1113 = v592[v1106[v1112]];
                if v1113 then
                    v561[v1111] = v567 .. "::" .. table.concat(v1113, "::, ::") .. "::\n" .. v1112;
                end;
            end;
            if not v568 then
                table.insert(v561, v567 .. "end\n");
            end;
            return;
        end;
    end;
    v565(v554, "");
    table.insert(v561, 1, (("-- Disassembled with Konstant V%*'s disassembler, made by plusgiant5\n\t\t-- Disassembled on %*\n\t\t-- Luau version %*%*\n\t\t-- Time taken: %* seconds\n\n"):format("2.1", os.date("%Y-%m-%d %H:%M:%S"), v556, if v557 then (", Types version %*"):format(v557) else "", (string.format("%.6f", l_clock_0() - v558)))));
    v562 = "";
    local v1114 = 0;
    for _, v1116 in ipairs(v561) do
        v1114 = v1114 + #v1116;
    end;
    local v1117 = buffer.create(v1114 - 1);
    local v1118 = 0;
    for v1119, v1120 in ipairs(v561) do
        if v1119 == #v561 then
            v1120 = string.sub(v1120, 1, #v1120 - 1);
        end;
        buffer.writestring(v1117, v1118, v1120);
        v1118 = v1118 + #v1120;
    end;
    return buffer.tostring(v1117);
end;
local l_prefix_error_0 = v22.prefix_error;
local l_prefix_warning_0 = v22.prefix_warning;
local l_prefix_information_0 = v22.prefix_information;
local function v4318(v1125, v1126)
    local v1127 = l_clock_0();
    v27 = v1127;
    local v1128 = v43();
    v1128:start_benchmark("Global Initialization");
    v551 = 0;
    local v1129 = v1126 or {};
    assert(v1129);
    for v1130 in pairs(v1129) do
        if v22[v1130] == nil then
            error("Unknown setting \"" .. tostring(v1130) .. "\"");
        end;
    end;
    for v1131, v1132 in pairs(v22) do
        if v1129[v1131] == nil then
            v1129[v1131] = v1132;
        end;
    end;
    if v1129.smart_var_level then
        assert(v1129.smart_var_level == math.floor(v1129.smart_var_level), "Expected `smart_var_level` to be an integer");
        assert(v1129.smart_var_level >= 0, "Expected `smart_var_level` to be >= 0");
        assert(v1129.smart_var_level <= 3, "Expected `smart_var_level` to be <= 3");
    end;
    local l_prefix_error_1 = v1129.prefix_error;
    assert(l_prefix_error_1);
    if string.match(l_prefix_error_1, "\n") then
        error("Cannot have newline characters in `prefix_error`");
    end;
    l_prefix_error_0 = l_prefix_error_1;
    local l_prefix_warning_1 = v1129.prefix_warning;
    assert(l_prefix_warning_1);
    if string.match(l_prefix_warning_1, "\n") then
        error("Cannot have newline characters in `prefix_warning`");
    end;
    l_prefix_warning_0 = l_prefix_warning_1;
    local l_prefix_information_1 = v1129.prefix_information;
    assert(l_prefix_information_1);
    if string.match(l_prefix_information_1, "\n") then
        error("Cannot have newline characters in `prefix_information`");
    end;
    l_prefix_information_0 = l_prefix_information_1;
    if string.byte(v1125, 1, 1) == 0 then
        local v1136 = ("-- Decompiled with Konstant%*, a fast Luau decompiler made in Luau by plusgiant5\n"):format("2.1");
        if type(v1125) ~= "string" and l_getscripthash_0 then
            v1136 = v1136 .. ("-- Script hash: %*\n"):format((string.upper(l_getscripthash_0(v1125))));
        end;
        return (((v1136 .. ("-- Decompiled on %*\n"):format((os.date("%Y-%m-%d %H:%M:%S")))) .. ("-- Time taken: %* seconds\n"):format((string.format("%.6f", l_clock_0() - v1127)))) .. "\n-- Target script didn't compile. Compilation error below:\n") .. "--[[\n" .. string.sub(v1125, 2, #v1125) .. "\n]]";
    else
        local v1137, v1138, _, v1140 = v296(v1125);
        v299 = v1138;
        local v1141 = {};
        local v1142 = {};
        local function _(v1143, v1144)
            table.insert(v1142, {
                type = v1143, 
                content = v1144
            });
        end;
        local v1146 = {};
        local function _(v1147)
            while v1147.t == "name" do
                local l_override_expr_0 = v1147.name.override_expr;
                if l_override_expr_0 then
                    v1147 = l_override_expr_0;
                else
                    break;
                end;
            end;
            return v1147;
        end;
        local function _(v1150, v1151)
            local l_v1150_0 = v1150;
            while l_v1150_0.t == "name" do
                local l_override_expr_1 = l_v1150_0.name.override_expr;
                if l_override_expr_1 then
                    l_v1150_0 = l_override_expr_1;
                else
                    break;
                end;
            end;
            v1150 = l_v1150_0;
            if v1150.t == "name" then
                return v1150.name == v1151;
            else
                return false;
            end;
        end;
        local function _(v1155)
            local l_var_num_0 = v1155.var_num;
            assert(l_var_num_0);
            return l_var_num_0;
        end;
        local function _(v1158)
            local l_var_list_0 = v1158.var_list;
            assert(l_var_list_0);
            return l_var_list_0;
        end;
        local function _(v1161, v1162)
            for v1163 in pairs(v1162.contributors) do
                v1161.contributors[v1163] = true;
            end;
            v1161.contributors[v1162] = true;
        end;
        local function _(v1165, v1166)
            table.insert(v1165.reads, v1166);
            table.insert(v1166.reads, v1165);
        end;
        local function _(v1168, v1169)
            table.insert(v1168.writes, v1169);
            table.insert(v1169.writes, v1168);
        end;
        local function v1175(v1171, v1172)
            local v1173 = table.find(v1171.reads, v1172);
            assert(v1173);
            table.remove(v1171.reads, v1173);
            local v1174 = table.find(v1172.reads, v1171);
            assert(v1174);
            table.remove(v1172.reads, v1174);
        end;
        local function v1180(v1176, v1177)
            local v1178 = table.find(v1176.writes, v1177);
            assert(v1178);
            table.remove(v1176.writes, v1178);
            local v1179 = table.find(v1177.writes, v1176);
            assert(v1179);
            table.remove(v1177.writes, v1179);
        end;
        local function v1187(v1181, v1182)
            for _, v1184 in ipairs(v1182.reads) do
                table.insert(v1181.reads, v1184);
                table.insert(v1184.reads, v1181);
            end;
            for _, v1186 in ipairs(v1182.writes) do
                table.insert(v1181.writes, v1186);
                table.insert(v1186.writes, v1181);
            end;
        end;
        local function v1194(v1188, v1189)
            for _, v1191 in ipairs(v1189.reads) do
                v1175(v1188, v1191);
            end;
            for _, v1193 in ipairs(v1189.writes) do
                v1180(v1188, v1193);
            end;
        end;
        local v1195 = 1;
        local v1196 = {
            [0] = "nil", 
            [1] = "boolean", 
            [2] = "number", 
            [3] = "string", 
            [4] = "table", 
            [5] = "function", 
            [6] = "thread", 
            [7] = "userdata", 
            [8] = "vector", 
            [9] = "buffer", 
            [15] = "any"
        };
        local function _(v1197)
            local v1198 = bit32.band(v1197, 128) > 0;
            local v1199 = v1196[v1197];
            print("Type info", v1197, "is", v1199);
            if v1199 then
                return {
                    type = v1199, 
                    optional = v1198
                };
            else
                return {
                    type = "invalid", 
                    optional = false
                };
            end;
        end;
        local function _(v1201)
            v1201.condition = v215[v1201.condition];
        end;
        local v1203 = {};
        local function v1205(v1204)
            return {
                t = "comment", 
                lines = v1203, 
                reads = {}, 
                writes = {}, 
                text = v1204, 
                stack = 1
            };
        end;
        local v1206 = {};
        local v1207 = 1;
        local function _(v1208)
            return v1206[v1208];
        end;
        local function _(v1210)
            local v1211 = v1206[v1210];
            assert(v1211);
            return v1211;
        end;
        local v1213 = {};
        local function _(v1214)
            local v1215 = v1213[v1214];
            local l_v1214_0 = v1214;
            local v1217 = v1215 or 1;
            while v1206[l_v1214_0] or v1141[l_v1214_0] do
                v1217 = v1217 + 1;
                l_v1214_0 = v1214 .. "_" .. v1217;
            end;
            v1213[v1214] = v1217;
            return l_v1214_0;
        end;
        local function v1223(v1219, v1220, v1221)
            if v1206[v1219] and v1219 ~= "_" then
                error((("[alloc] Variable %* already allocated"):format(v1219)));
            end;
            local v1222 = {
                name = v1219, 
                attributes = {}, 
                reads = {}, 
                writes = {}, 
                registers = v1220, 
                var_num = #v1221 + 1, 
                var_list = v1221
            };
            v1206[v1219] = v1222;
            table.insert(v1221, v1222);
            return v1206[v1219];
        end;
        local function _(v1224)
            local v1225 = v1206[v1224];
            if v1225 then
                return v1225;
            else
                return (v1223(v1224, {
                    beginning = -1, 
                    ending = -1
                }, {}));
            end;
        end;
        local function _(v1227, v1228, v1229)
            v1227.init_expr = v1228;
            v1227.var_num = v1229;
        end;
        local function _(v1231)
            local l_name_0 = v1231.name;
            if not v1206[l_name_0] then
                error((("[free] Variable %* not allocated"):format(v1231.name)));
            end;
            v1206[l_name_0] = nil;
        end;
        local function _(v1234, v1235)
            local l_name_1 = v1234.name;
            if not v1206[l_name_1] then
                error((("[write] Variable %* not allocated"):format(v1234.name)));
            end;
            if v1206[l_name_1].luau_type and v1206[l_name_1].luau_type ~= v1235 then
                error((("[write] Attempt to retype %*: %* to %*: %*"):format(v1234.name, v1206[l_name_1].luau_type, v1234, v1235)));
            end;
            v1206[l_name_1].luau_type = v1235;
        end;
        local function _(v1238, v1239)
            local l_name_2 = v1238.name;
            if not v1206[l_name_2] then
                error((("[write] Variable %* not allocated"):format(l_name_2)));
            end;
            v1206[l_name_2] = nil;
            v1238.name = v1239;
            v1206[v1239] = v1238;
            v1238.attributes.renamed = true;
        end;
        local function _(v1242, v1243)
            local l_name_3 = v1242.name;
            if not v1206[l_name_3] then
                error((("[write] Variable %* not allocated"):format(l_name_3)));
            end;
            v1206[l_name_3] = nil;
            v1242.override_expr = v1243;
        end;
        local function _()
            local v1246 = "var" .. tostring(v1195);
            local v1247 = v1213[v1246];
            local l_v1246_0 = v1246;
            local v1249 = v1247 or 1;
            while v1206[l_v1246_0] or v1141[l_v1246_0] do
                v1249 = v1249 + 1;
                l_v1246_0 = v1246 .. "_" .. v1249;
            end;
            v1213[v1246] = v1249;
            local l_l_v1246_0_0 = l_v1246_0;
            v1195 = v1195 + 1;
            return l_l_v1246_0_0;
        end;
        local function _(v1252, v1253)
            local l_v1223_0 = v1223;
            local v1255 = "var" .. tostring(v1195);
            local v1256 = v1213[v1255];
            local l_v1255_0 = v1255;
            local v1258 = v1256 or 1;
            while v1206[l_v1255_0] or v1141[l_v1255_0] do
                v1258 = v1258 + 1;
                l_v1255_0 = v1255 .. "_" .. v1258;
            end;
            v1213[v1255] = v1258;
            local l_l_v1255_0_0 = l_v1255_0;
            v1195 = v1195 + 1;
            return (l_v1223_0(l_l_v1255_0_0, v1252, v1253));
        end;
        local _ = function(v1261, _)
            local v1263 = "arg" .. tostring(v1207);
            if v1129.exact_argument_names then
                v1263 = v1261 .. "_" .. v1263;
            end;
            local l_v1263_0 = v1263;
            local v1265 = v1213[l_v1263_0];
            local l_l_v1263_0_0 = l_v1263_0;
            local v1267 = v1265 or 1;
            while v1206[l_l_v1263_0_0] or v1141[l_l_v1263_0_0] do
                v1267 = v1267 + 1;
                l_l_v1263_0_0 = l_v1263_0 .. "_" .. v1267;
            end;
            v1213[l_v1263_0] = v1267;
            v1263 = l_l_v1263_0_0;
            v1207 = v1207 + 1;
            return v1263;
        end;
        local function _(v1269, v1270, v1271)
            local l_v1223_1 = v1223;
            local l_name_4 = v1269.name;
            local v1274 = "arg" .. tostring(v1207);
            if v1129.exact_argument_names then
                v1274 = l_name_4 .. "_" .. v1274;
            end;
            local l_v1274_0 = v1274;
            local v1276 = v1213[l_v1274_0];
            local l_l_v1274_0_0 = l_v1274_0;
            local v1278 = v1276 or 1;
            while v1206[l_l_v1274_0_0] or v1141[l_l_v1274_0_0] do
                v1278 = v1278 + 1;
                l_l_v1274_0_0 = l_v1274_0 .. "_" .. v1278;
            end;
            v1213[l_v1274_0] = v1278;
            v1274 = l_l_v1274_0_0;
            v1207 = v1207 + 1;
            l_v1223_1 = l_v1223_1(v1274, {
                beginning = v1270, 
                ending = v1270
            }, v1271);
            l_v1223_1.func_name = v1269;
            return l_v1223_1;
        end;
        local v1280 = {};
        local function v1281()
            return {
                t = "nothing", 
                lines = v1203, 
                reads = {}, 
                writes = {}
            };
        end;
        local function v1283(v1282)
            if v1282 then
                return {
                    t = "nil", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}, 
                    invisible = true
                };
            else
                return {
                    t = "nil", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}
                };
            end;
        end;
        local function v1297(v1284, v1285, _)
            local v1287 = table.clone(v1284.reads);
            local v1288 = table.clone(v1284.writes);
            local v1289 = table.clone(v1284.contributors);
            for _, v1291 in ipairs(v1285) do
                for _, v1293 in ipairs(v1291.reads) do
                    table.insert(v1287, v1293);
                end;
                for _, v1295 in ipairs(v1291.writes) do
                    table.insert(v1288, v1295);
                end;
                for v1296 in pairs(v1291.contributors) do
                    v1289[v1296] = true;
                end;
            end;
            return {
                t = "call", 
                reads = v1287, 
                writes = v1288, 
                contributors = v1289, 
                func = v1284, 
                args = v1285
            };
        end;
        local function v1299(v1298)
            return {
                t = "name", 
                reads = {
                    v1298
                }, 
                writes = {}, 
                contributors = {}, 
                name = v1298
            };
        end;
        local function v1301(v1300)
            return {
                t = "not", 
                reads = table.clone(v1300.reads), 
                writes = table.clone(v1300.writes), 
                contributors = table.clone(v1300.contributors), 
                precedence = 2, 
                rhs = v1300
            };
        end;
        local function v1309(v1302, v1303)
            local v1304 = {
                t = "and", 
                reads = v89(v1302.reads, v1303.reads), 
                writes = v89(v1302.writes, v1303.writes)
            };
            local l_contributors_0 = v1302.contributors;
            local l_contributors_1 = v1303.contributors;
            local v1307 = table.clone(l_contributors_0);
            for v1308 in pairs(l_contributors_1) do
                v1307[v1308] = true;
            end;
            v1304.contributors = v1307;
            v1304.precedence = 7;
            v1304.lhs = v1302;
            v1304.rhs = v1303;
            return v1304;
        end;
        local function v1318(v1310, v1311, v1312)
            if v1312 then
                local v1313 = {
                    t = "condition", 
                    reads = v89(v1310.reads, v1312.reads), 
                    writes = v89(v1310.writes, v1312.writes)
                };
                local l_contributors_2 = v1310.contributors;
                local l_contributors_3 = v1312.contributors;
                local v1316 = table.clone(l_contributors_2);
                for v1317 in pairs(l_contributors_3) do
                    v1316[v1317] = true;
                end;
                v1313.contributors = v1316;
                v1313.precedence = 6;
                v1313.condition = v1311;
                v1313.lhs = v1310;
                v1313.rhs = v1312;
                return v1313;
            else
                return {
                    t = "condition", 
                    reads = table.clone(v1310.reads), 
                    writes = table.clone(v1310.writes), 
                    contributors = table.clone(v1310.contributors), 
                    precedence = 2, 
                    condition = v1311, 
                    lhs = v1310
                };
            end;
        end;
        local function v1325(v1319, v1320, v1321, v1322, v1323)
            local v1324 = {
                t = "define function", 
                reads = {}, 
                writes = {}, 
                lines = v1319, 
                func = v1320, 
                func_name = v1321, 
                define_function_type = v1322, 
                path = v1323
            };
            v1187(v1324, v1320);
            return v1324;
        end;
        local function v1328(v1326, v1327)
            return {
                t = "return", 
                lines = v1326, 
                reads = {}, 
                writes = {}, 
                values = v1327
            };
        end;
        local function _(v1329)
            if v1329.t == "condition" then
                v1329.condition = v215[v1329.condition];
                return v1329;
            elseif v1329.t == "not" then
                return v1329.rhs;
            else
                return (v1301(v1329));
            end;
        end;
        local v1331 = {};
        local v1332 = {};
        local v1333 = {};
        local v1334 = {};
        local v1335 = {};
        local v1336 = 0;
        local v1337 = {};
        local v1338 = {};
        local v1339 = 0;
        local function _(v1340)
            v1338[v1340] = true;
            v1339 = v1339 + 1;
        end;
        local function v1342()
            return {
                global_failed_instructions_count = v551, 
                notices = table.clone(v1142), 
                lines = table.clone(v1203), 
                variable_mapped_long_string_constants = table.clone(v1332), 
                variable_mapped_long_string_constants_order = table.clone(v1333), 
                long_string_usage_counts = table.clone(v1334), 
                long_string_constant_already_used = table.clone(v1335), 
                long_string_variable_count = v1336, 
                lines_had_skipped_return = table.clone(v1337), 
                condition_stop_points = table.clone(v1338), 
                marked_condition_stop_points = v1339
            };
        end;
        local function _(v1343)
            v551 = v1343.global_failed_instructions_count;
            v1142 = v1343.notices;
            v1203 = v1343.lines;
            v1332 = v1343.variable_mapped_long_string_constants;
            v1333 = v1343.variable_mapped_long_string_constants_order;
            v1334 = v1343.long_string_usage_counts;
            v1335 = v1343.long_string_constant_already_used;
            v1336 = v1343.long_string_variable_count;
            v1337 = v1343.lines_had_skipped_return;
            v1338 = v1343.condition_stop_points;
            v1339 = v1343.marked_condition_stop_points;
        end;
        local v1345 = nil;
        local function v3158(v1346, v1347)
            local v1348 = v43();
            v1348:start_benchmark("Initialization");
            local l_v300_0 = v300;
            v300 = v1346;
            v1207 = 1;
            local v1350 = 0;
            local l_constants_1 = v1346.constants;
            local l_protos_1 = v1346.protos;
            local l_code_1 = v1346.code;
            local v1354 = #l_code_1;
            local v1355 = nil;
            if v1346.stack_size > 0 then
                v1355 = table.create(v1346.stack_size - 1);
                v1355[0] = nil;
            else
                v1355 = {};
            end;
            local v1356 = {};
            local v1357 = {};
            local v1358 = 0;
            local v1359 = 0;
            local v1360 = {};
            local v1361 = {};
            local v1362 = {};
            local v1363 = {};
            local v1364 = {};
            local function v1365()
                if v1363.t == "name" then
                    warn(debug.traceback());
                end;
                if not v1363.t then
                    error("messageWAHTTERSDGXCvlkhx d");
                end;
                table.insert(v1203, v1363);
                v1146[v1363] = v1364;
                v1363 = {
                    t = "Unknown", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}
                };
            end;
            local function v1368(v1366, v1367)
                if v1363.t == "name" then
                    warn(debug.traceback());
                end;
                v1366 = math.max(v1366, 1);
                v1363.index = v1366;
                table.insert(v1367 or v1203, v1366, v1363);
                v1146[v1363] = v1364;
                v1363 = {
                    t = "Unknown", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}
                };
            end;
            local function v1371(v1369)
                local v1370 = v1203[#v1203];
                if v1370 and v1370.t == "comment" and string.sub(v1370.text, 1, #v1369) == v1369 then
                    v1370.stack = v1370.stack + 1;
                    v1370.text = v1369 .. " (x" .. v1370.stack .. ")";
                    return;
                else
                    v1363 = v1205(v1369);
                    v1365();
                    return;
                end;
            end;
            local function v1374(v1372, v1373)
                v1363 = v1205(v1373);
                v1368(v1372);
            end;
            local v1375 = nil;
            local function v1378(v1376, _)
                return v1375(v1376, (v1283(true)));
            end;
            local function _()
                v1363 = {
                    t = "nothing", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}
                };
            end;
            local function v1387(v1380, v1381)
                if v1381.varname then
                    assert(#v1380 == 1);
                    assert(v1380[1] == v1381.varname);
                end;
                assert(#v1380 > 0);
                v1363 = {
                    t = "define variable", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}, 
                    names = v1380, 
                    value = v1381
                };
                if v1381.t == "nil" and v1381.invisible then
                    for v1382, v1383 in ipairs(v1380) do
                        v1383.init_expr = v1381;
                        v1383.var_num = v1382;
                    end;
                else
                    for v1384, v1385 in ipairs(v1380) do
                        v1385.init_expr = v1381;
                        v1385.var_num = v1384;
                        local l_v1363_0 = v1363;
                        table.insert(l_v1363_0.writes, v1385);
                        table.insert(v1385.writes, l_v1363_0);
                    end;
                end;
                v1187(v1363, v1381);
            end;
            local v1388 = nil;
            local v1389 = {};
            local v1390 = {};
            local function _(v1391, v1392)
                v1389[v1391] = v1392;
            end;
            local function _(v1394)
                for v1395 = v1394.beginning, v1394.ending do
                    if v1389[v1395] then
                        v1389[v1395] = nil;
                    end;
                end;
            end;
            local function _(v1397)
                return v1389[v1397];
            end;
            local function _(v1399)
                v1390[v1399] = true;
            end;
            local function _(v1401)
                v1390[v1401] = nil;
            end;
            local function _(v1403)
                if v1390[v1403] then
                    return true;
                else
                    return false;
                end;
            end;
            local function _(v1405)
                local v1406 = v1355[v1405];
                if not v1406 then
                    v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1405) .. "]");
                    v1406 = v1375(v1405, (v1283(true)));
                end;
                return v1406;
            end;
            local function v1410(v1408)
                if v1389[v1408] then
                    return v1388(v1408, v1389[v1408]);
                else
                    local v1409 = v1355[v1408];
                    if not v1409 then
                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1408) .. "]");
                        v1409 = v1375(v1408, (v1283(true)));
                    end;
                    return v1409;
                end;
            end;
            local function v1417(v1411, v1412, v1413)
                assert(#v1413 > 0);
                local v1414 = 0;
                for v1415 = v1411.beginning, v1411.ending do
                    v1414 = v1414 + 1;
                    local v1416 = v1413[v1414];
                    assert(v1416);
                    v1389[v1415] = v1416;
                end;
                v1387(v1413, v1412);
                v1365();
            end;
            local function v1425(v1418, v1419)
                assert(#v1419 > 0);
                local l_beginning_1 = v1418.beginning;
                local v1421 = v1355[l_beginning_1];
                assert(v1421);
                local v1422 = 0;
                for v1423 = l_beginning_1, v1418.ending do
                    v1422 = v1422 + 1;
                    local v1424 = v1419[v1422];
                    assert(v1424);
                    v1389[v1423] = v1424;
                end;
                v1387(v1419, v1421);
                v1365();
            end;
            local v1426 = nil;
            local function _(v1427, v1428)
                v1355[v1427] = v1428;
            end;
            local function _(v1430)
                if v1331[v1430] then
                    v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    return v1430;
                else
                    v1331[v1430] = true;
                    return v1430;
                end;
            end;
            local function v1435(v1432, v1433)
                local v1434 = {
                    t = "set variable", 
                    reads = {}, 
                    writes = {}, 
                    lines = v1203, 
                    name = v1432, 
                    value = v1433
                };
                v1187(v1434, v1433);
                table.insert(v1434.writes, v1432);
                table.insert(v1432.writes, v1434);
                v1363 = v1434;
            end;
            v1426 = v1435;
            local function v1439(v1436, v1437)
                local v1438 = {
                    t = "set global", 
                    reads = {}, 
                    writes = {}, 
                    lines = v1203, 
                    name = v1436, 
                    value = v1437
                };
                v1187(v1438, v1437);
                v1363 = v1438;
            end;
            local function v1446(v1440, v1441, v1442)
                local v1443;
                if v1389[v1440] then
                    v1443 = v1388(v1440, v1389[v1440]);
                else
                    local v1444 = v1355[v1440];
                    if not v1444 then
                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1440) .. "]");
                        v1444 = v1375(v1440, (v1283(true)));
                    end;
                    v1443 = v1444;
                end;
                if v1331[v1443] then
                    v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                else
                    v1331[v1443] = true;
                end;
                local l_v1443_0 = v1443;
                v1363 = {
                    t = "set table", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}, 
                    table = l_v1443_0, 
                    key = v1441, 
                    value = v1442
                };
                v1187(v1363, l_v1443_0);
                v1187(v1363, v1441);
                v1187(v1363, v1442);
            end;
            local function v1459(v1447, v1448)
                local v1449 = {};
                local v1450 = v1328(v1203, v1449);
                if v1448 == -1 then
                    for v1451 = v1447, v297 do
                        local v1452;
                        if v1389[v1451] then
                            v1452 = v1388(v1451, v1389[v1451]);
                        else
                            local v1453 = v1355[v1451];
                            if not v1453 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1451) .. "]");
                                v1453 = v1375(v1451, (v1283(true)));
                            end;
                            v1452 = v1453;
                        end;
                        if v1331[v1452] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v1452] = true;
                        end;
                        local l_v1452_0 = v1452;
                        v1187(v1450, l_v1452_0);
                        table.insert(v1449, l_v1452_0);
                    end;
                else
                    for v1455 = v1447, v1447 + v1448 - 1 do
                        local v1456;
                        if v1389[v1455] then
                            v1456 = v1388(v1455, v1389[v1455]);
                        else
                            local v1457 = v1355[v1455];
                            if not v1457 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1455) .. "]");
                                v1457 = v1375(v1455, (v1283(true)));
                            end;
                            v1456 = v1457;
                        end;
                        if v1331[v1456] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v1456] = true;
                        end;
                        local l_v1456_0 = v1456;
                        v1187(v1450, l_v1456_0);
                        table.insert(v1449, l_v1456_0);
                    end;
                end;
                v1363 = v1450;
            end;
            local function v1460()
                v1363 = {
                    t = "break", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}
                };
            end;
            local function v1461()
                v1363 = {
                    t = "continue", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}
                };
            end;
            local function v1463(v1462)
                v1363 = {
                    t = "unknown jump", 
                    lines = v1203, 
                    reads = {}, 
                    writes = {}, 
                    destination = v1462
                };
            end;
            local function v1486(v1464)
                local v1465 = {};
                local l_var_reg_range_0 = v1464.var_reg_range;
                local l_beginning_2 = l_var_reg_range_0.beginning;
                local l_ending_1 = l_var_reg_range_0.ending;
                if l_beginning_2 == l_ending_1 then
                    local v1469 = {};
                    local l_v1223_2 = v1223;
                    local v1471 = "var" .. tostring(v1195);
                    local v1472 = v1213[v1471];
                    local l_v1471_0 = v1471;
                    local v1474 = v1472 or 1;
                    while v1206[l_v1471_0] or v1141[l_v1471_0] do
                        v1474 = v1474 + 1;
                        l_v1471_0 = v1471 .. "_" .. v1474;
                    end;
                    v1213[v1471] = v1474;
                    local l_l_v1471_0_0 = l_v1471_0;
                    v1195 = v1195 + 1;
                    table.insert(v1465, (l_v1223_2(l_l_v1471_0_0, l_var_reg_range_0, v1469)));
                    return v1465;
                else
                    local v1476 = {};
                    for v1477 = l_beginning_2, l_ending_1 do
                        local v1478 = {
                            beginning = v1477, 
                            ending = v1477
                        };
                        local l_v1223_3 = v1223;
                        local v1480 = "var" .. tostring(v1195);
                        local v1481 = v1213[v1480];
                        local l_v1480_0 = v1480;
                        local v1483 = v1481 or 1;
                        while v1206[l_v1480_0] or v1141[l_v1480_0] do
                            v1483 = v1483 + 1;
                            l_v1480_0 = v1480 .. "_" .. v1483;
                        end;
                        v1213[v1480] = v1483;
                        local l_l_v1480_0_0 = l_v1480_0;
                        v1195 = v1195 + 1;
                        local v1485 = l_v1223_3(l_l_v1480_0_0, v1478, v1476);
                        v1485.attributes.multireg = true;
                        table.insert(v1465, v1485);
                    end;
                    return v1465;
                end;
            end;
            local v1487 = true;
            local function v1496()
                local v1488 = v1357[v1358];
                assert(v1487);
                v1487 = false;
                if v1488 then
                    for v1489 = #v1488, 1, -1 do
                        local v1490 = v1488[v1489];
                        local l_type_1 = v1490.type;
                        if l_type_1 == "lockvar" then
                            local l_var_reg_range_1 = v1490.var_reg_range;
                            for v1493 = l_var_reg_range_1.beginning, l_var_reg_range_1.ending do
                                v1390[v1493] = true;
                            end;
                            table.remove(v1488, v1489);
                        elseif l_type_1 == "unlockvar" then
                            local l_var_reg_range_2 = v1490.var_reg_range;
                            for v1495 = l_var_reg_range_2.beginning, l_var_reg_range_2.ending do
                                v1390[v1495] = nil;
                            end;
                            table.remove(v1488, v1489);
                        end;
                    end;
                    if #v1488 == 0 then
                        v1357[v1358] = nil;
                    end;
                end;
            end;
            local function v1516(v1497, v1498)
                local v1499 = v1357[v1358];
                assert(not v1487);
                v1487 = true;
                local v1500 = v1389[v1497];
                if v1500 then
                    if v1390[v1497] and true or false then
                        local v1501 = v1203[#v1203];
                        local v1502 = nil;
                        if v1501 and v1501.t == "set variable" and v1501.name == v1500 then
                            local l_value_0 = v1501.value;
                            v1194(v1501, l_value_0);
                            local l_t_0 = v1498.t;
                            if l_t_0 == "constant index" then
                                if v1498.table.t == "name" and v1498.table.name == v1500 then
                                    v1498.table = l_value_0;
                                    v1502 = true;
                                end;
                            elseif l_t_0 == "call" and v1498.func.t == "name" and v1498.func.name == v1500 then
                                v1498.func = l_value_0;
                                v1502 = true;
                            end;
                            if v1502 then
                                v1501.value = v1498;
                                v1187(v1501, v1498);
                            end;
                        end;
                        if not v1502 then
                            v1435(v1500, v1498);
                            v1365();
                        end;
                    else
                        local l_registers_0 = v1500.registers;
                        for v1506 = l_registers_0.beginning, l_registers_0.ending do
                            if v1389[v1506] then
                                v1389[v1506] = nil;
                            end;
                        end;
                    end;
                end;
                if v1499 then
                    for _, v1508 in ipairs(v1499) do
                        local l_var_reg_range_3 = v1508.var_reg_range;
                        local l_beginning_3 = l_var_reg_range_3.beginning;
                        local l_ending_2 = l_var_reg_range_3.ending;
                        local v1512 = false;
                        if l_beginning_3 <= v1497 then
                            v1512 = v1497 <= l_ending_2;
                        end;
                        if not v1512 then

                        end;
                        if v1508.type == "defvar" then
                            v1512 = nil;
                            if not v1508.predef then
                                l_beginning_3 = v1508.var_reg_range;
                                if l_beginning_3.ending - l_beginning_3.beginning + 1 == 1 then
                                    l_beginning_3 = v1508.var_reg_range.beginning;
                                    if v1389[l_beginning_3] then
                                        l_var_reg_range_3 = v1388(l_beginning_3, v1389[l_beginning_3]);
                                    else
                                        local v1513 = v1355[l_beginning_3];
                                        if not v1513 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_beginning_3) .. "]");
                                            v1513 = v1375(l_beginning_3, (v1283(true)));
                                        end;
                                        l_var_reg_range_3 = v1513;
                                    end;
                                    if l_var_reg_range_3 and l_var_reg_range_3.varname then
                                        v1512 = {
                                            l_var_reg_range_3.varname
                                        };
                                    end;
                                end;
                            end;
                            v1512 = v1512 or v1486(v1508);
                            if v1508.no_inline then
                                for _, v1515 in ipairs(v1512) do
                                    v1515.attributes.no_inline = true;
                                end;
                            end;
                            if v1508.predef then
                                v1417(v1508.var_reg_range, v1375(nil, (v1283(true))), v1512);
                            else
                                v1425(v1508.var_reg_range, v1512);
                            end;
                        else
                            v1371(l_prefix_warning_1 .. ": Skipped task `" .. v1508.type .. "` above");
                        end;
                    end;
                end;
            end;
            local function v1520()
                local v1517 = v1357[v1358];
                assert(not v1487);
                v1487 = true;
                if v1517 then
                    for _, v1519 in ipairs(v1517) do
                        if v1519.type == "defvar" and v1519.predef then
                            v1417(v1519.var_reg_range, v1375(nil, (v1283(true))), (v1486(v1519)));
                        else
                            v1371(l_prefix_warning_1 .. ": Skipped task `" .. v1519.type .. "` above");
                        end;
                    end;
                end;
            end;
            local v1521 = nil;
            local function _(v1522, v1523, v1524)
                local v1525 = {};
                local v1526;
                if v1389[v1522] then
                    v1526 = v1388(v1522, v1389[v1522]);
                else
                    local v1527 = v1355[v1522];
                    if not v1527 then
                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1522) .. "]");
                        v1527 = v1375(v1522, (v1283(true)));
                    end;
                    v1526 = v1527;
                end;
                if v1331[v1526] then
                    v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                else
                    v1331[v1526] = true;
                end;
                local l_v1526_0 = v1526;
                v1526 = {
                    t = "call", 
                    reads = {}, 
                    writes = {}, 
                    lines = v1203, 
                    func = l_v1526_0, 
                    args = v1525, 
                    namecall_method = v1524
                };
                v1187(v1526, l_v1526_0);
                local v1529 = v1524 and 2 or 1;
                for v1530 = v1529, v1523 do
                    local v1531 = v1522 + v1530;
                    local v1532;
                    if v1389[v1531] then
                        v1532 = v1388(v1531, v1389[v1531]);
                    else
                        local v1533 = v1355[v1531];
                        if not v1533 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1531) .. "]");
                            v1533 = v1375(v1531, (v1283(true)));
                        end;
                        v1532 = v1533;
                    end;
                    if v1331[v1532] then
                        v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    else
                        v1331[v1532] = true;
                    end;
                    local l_v1532_0 = v1532;
                    table.insert(v1525, l_v1532_0);
                    v1187(v1526, l_v1532_0);
                end;
                v1363 = v1526;
            end;
            v1375 = function(v1536, v1537)
                if v1536 then
                    local v1538 = v1355[v1536];
                    if v1538 then
                        v1356[v1538] = nil;
                    end;
                    v1355[v1536] = v1537;
                    v1356[v1537] = v1536;
                end;
                return v1537;
            end;
            local function v1540(v1539)
                return v1375(v1539, {
                    t = "varargs", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}
                });
            end;
            local function v1543(v1541, v1542)
                assert(v1542);
                return v1375(v1541, {
                    t = "global", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}, 
                    name = v1542
                });
            end;
            local function v1548(v1544, v1545)
                if not v1545 then
                    error("Bad Konstant");
                end;
                if v1545.type == 3 then
                    local l_value_1 = v1545.value;
                    if #l_value_1 > 128 then
                        if v1332[l_value_1] then
                            local l_v1334_0 = v1334;
                            l_v1334_0[l_value_1] = l_v1334_0[l_value_1] + 1;
                        elseif v1335[l_value_1] then
                            v1336 = v1336 + 1;
                            v1332[l_value_1] = "longstring" .. v1336;
                            v1334[l_value_1] = 2;
                            table.insert(v1333, l_value_1);
                        else
                            v1335[l_value_1] = true;
                        end;
                    end;
                end;
                return v1375(v1544, {
                    t = "constant", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}, 
                    const = v1545
                });
            end;
            local function v1550(v1549)
                return v1375(v1549, {
                    t = "new table", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}, 
                    initializers = {}, 
                    initializers_order = {}
                });
            end;
            local function v1555(v1551, v1552, v1553, v1554)
                return v1375(v1551, {
                    t = "constant index", 
                    reads = table.clone(v1552.reads), 
                    writes = table.clone(v1552.writes), 
                    contributors = table.clone(v1552.contributors), 
                    table = v1552, 
                    index = v1553, 
                    namecall = v1554
                });
            end;
            v1388 = function(v1556, v1557)
                return v1375(v1556, (v1299(v1557)));
            end;
            local function v1560(v1558, v1559)
                return v1375(v1558, {
                    t = "boolean", 
                    reads = {}, 
                    writes = {}, 
                    contributors = {}, 
                    value = v1559
                });
            end;
            local function v1571(v1561, v1562, v1563)
                local l_v1375_0 = v1375;
                local l_v1561_0 = v1561;
                local v1566 = {
                    t = "or", 
                    reads = v89(v1562.reads, v1563.reads), 
                    writes = v89(v1562.writes, v1563.writes)
                };
                local l_contributors_4 = v1562.contributors;
                local l_contributors_5 = v1563.contributors;
                local v1569 = table.clone(l_contributors_4);
                for v1570 in pairs(l_contributors_5) do
                    v1569[v1570] = true;
                end;
                v1566.contributors = v1569;
                v1566.precedence = 8;
                v1566.lhs = v1562;
                v1566.rhs = v1563;
                return l_v1375_0(l_v1561_0, v1566);
            end;
            local function v1575(v1572, v1573, v1574)
                return v1375(v1572, (v1309(v1573, v1574)));
            end;
            local function v1580(v1576, v1577, v1578, v1579)
                return v1375(v1576, (v1318(v1577, v1578, v1579)));
            end;
            local function v1591(v1581, v1582, v1583)
                local l_v1375_1 = v1375;
                local l_v1581_0 = v1581;
                local v1586 = {
                    t = "addition", 
                    reads = v89(v1582.reads, v1583.reads), 
                    writes = v89(v1582.writes, v1583.writes)
                };
                local l_contributors_6 = v1582.contributors;
                local l_contributors_7 = v1583.contributors;
                local v1589 = table.clone(l_contributors_6);
                for v1590 in pairs(l_contributors_7) do
                    v1589[v1590] = true;
                end;
                v1586.contributors = v1589;
                v1586.precedence = 4;
                v1586.lhs = v1582;
                v1586.rhs = v1583;
                return l_v1375_1(l_v1581_0, v1586);
            end;
            local function v1602(v1592, v1593, v1594)
                local l_v1375_2 = v1375;
                local l_v1592_0 = v1592;
                local v1597 = {
                    t = "subtraction", 
                    reads = v89(v1593.reads, v1594.reads), 
                    writes = v89(v1593.writes, v1594.writes)
                };
                local l_contributors_8 = v1593.contributors;
                local l_contributors_9 = v1594.contributors;
                local v1600 = table.clone(l_contributors_8);
                for v1601 in pairs(l_contributors_9) do
                    v1600[v1601] = true;
                end;
                v1597.contributors = v1600;
                v1597.precedence = 4;
                v1597.lhs = v1593;
                v1597.rhs = v1594;
                return l_v1375_2(l_v1592_0, v1597);
            end;
            local function v1613(v1603, v1604, v1605)
                local l_v1375_3 = v1375;
                local l_v1603_0 = v1603;
                local v1608 = {
                    t = "multiplication", 
                    reads = v89(v1604.reads, v1605.reads), 
                    writes = v89(v1604.writes, v1605.writes)
                };
                local l_contributors_10 = v1604.contributors;
                local l_contributors_11 = v1605.contributors;
                local v1611 = table.clone(l_contributors_10);
                for v1612 in pairs(l_contributors_11) do
                    v1611[v1612] = true;
                end;
                v1608.contributors = v1611;
                v1608.precedence = 3;
                v1608.lhs = v1604;
                v1608.rhs = v1605;
                return l_v1375_3(l_v1603_0, v1608);
            end;
            local function v1624(v1614, v1615, v1616)
                local l_v1375_4 = v1375;
                local l_v1614_0 = v1614;
                local v1619 = {
                    t = "division", 
                    reads = v89(v1615.reads, v1616.reads), 
                    writes = v89(v1615.writes, v1616.writes)
                };
                local l_contributors_12 = v1615.contributors;
                local l_contributors_13 = v1616.contributors;
                local v1622 = table.clone(l_contributors_12);
                for v1623 in pairs(l_contributors_13) do
                    v1622[v1623] = true;
                end;
                v1619.contributors = v1622;
                v1619.precedence = 3;
                v1619.lhs = v1615;
                v1619.rhs = v1616;
                return l_v1375_4(l_v1614_0, v1619);
            end;
            local function v1635(v1625, v1626, v1627)
                local l_v1375_5 = v1375;
                local l_v1625_0 = v1625;
                local v1630 = {
                    t = "floor division", 
                    reads = v89(v1626.reads, v1627.reads), 
                    writes = v89(v1626.writes, v1627.writes)
                };
                local l_contributors_14 = v1626.contributors;
                local l_contributors_15 = v1627.contributors;
                local v1633 = table.clone(l_contributors_14);
                for v1634 in pairs(l_contributors_15) do
                    v1633[v1634] = true;
                end;
                v1630.contributors = v1633;
                v1630.precedence = 3;
                v1630.lhs = v1626;
                v1630.rhs = v1627;
                return l_v1375_5(l_v1625_0, v1630);
            end;
            local function v1646(v1636, v1637, v1638)
                local l_v1375_6 = v1375;
                local l_v1636_0 = v1636;
                local v1641 = {
                    t = "modulus", 
                    reads = v89(v1637.reads, v1638.reads), 
                    writes = v89(v1637.writes, v1638.writes)
                };
                local l_contributors_16 = v1637.contributors;
                local l_contributors_17 = v1638.contributors;
                local v1644 = table.clone(l_contributors_16);
                for v1645 in pairs(l_contributors_17) do
                    v1644[v1645] = true;
                end;
                v1641.contributors = v1644;
                v1641.precedence = 3;
                v1641.lhs = v1637;
                v1641.rhs = v1638;
                return l_v1375_6(l_v1636_0, v1641);
            end;
            local function v1649(v1647, v1648)
                return v1375(v1647, (v1301(v1648)));
            end;
            local function v1652(v1650, v1651)
                return v1375(v1650, {
                    t = "negate", 
                    reads = table.clone(v1651.reads), 
                    writes = table.clone(v1651.writes), 
                    contributors = table.clone(v1651.contributors), 
                    precedence = 2, 
                    rhs = v1651
                });
            end;
            local function v1655(v1653, v1654)
                return v1375(v1653, {
                    t = "length", 
                    reads = table.clone(v1654.reads), 
                    writes = table.clone(v1654.writes), 
                    contributors = table.clone(v1654.contributors), 
                    precedence = 2, 
                    rhs = v1654
                });
            end;
            local function v1666(v1656, v1657, v1658)
                local l_v1375_7 = v1375;
                local l_v1656_0 = v1656;
                local v1661 = {
                    t = "exponentiation", 
                    reads = v89(v1657.reads, v1658.reads), 
                    writes = v89(v1657.writes, v1658.writes)
                };
                local l_contributors_18 = v1657.contributors;
                local l_contributors_19 = v1658.contributors;
                local v1664 = table.clone(l_contributors_18);
                for v1665 in pairs(l_contributors_19) do
                    v1664[v1665] = true;
                end;
                v1661.contributors = v1664;
                v1661.precedence = 1;
                v1661.lhs = v1657;
                v1661.rhs = v1658;
                return l_v1375_7(l_v1656_0, v1661);
            end;
            local function v1679(v1667, v1668)
                local v1669 = {};
                local v1670 = {};
                local v1671 = {};
                for _, v1673 in ipairs(v1668) do
                    for _, v1675 in ipairs(v1673.reads) do
                        table.insert(v1669, v1675);
                    end;
                    for _, v1677 in ipairs(v1673.writes) do
                        table.insert(v1670, v1677);
                    end;
                    for v1678 in pairs(v1673.contributors) do
                        v1671[v1678] = true;
                    end;
                end;
                return v1375(v1667, {
                    t = "concatenation", 
                    reads = v1669, 
                    writes = v1670, 
                    contributors = v1671, 
                    precedence = 0, 
                    exprs = v1668
                });
            end;
            local function v1690(v1680, v1681, v1682)
                local l_v1375_8 = v1375;
                local l_v1680_0 = v1680;
                local v1685 = {
                    t = "get table", 
                    reads = v89(v1681.reads, v1682.reads), 
                    writes = v89(v1681.writes, v1682.writes)
                };
                local l_contributors_20 = v1681.contributors;
                local l_contributors_21 = v1682.contributors;
                local v1688 = table.clone(l_contributors_20);
                for v1689 in pairs(l_contributors_21) do
                    v1688[v1689] = true;
                end;
                v1685.contributors = v1688;
                v1685.table = v1681;
                v1685.index = v1682;
                return l_v1375_8(l_v1680_0, v1685);
            end;
            local function v1698(v1691, v1692)
                local v1693 = bit32.rrotate(bit32.band(v1692, 3221225472), 30);
                local v1694 = l_constants_1[bit32.rrotate(bit32.band(v1692, 1072693248), 20)];
                if v1693 == 2 then
                    local v1695 = l_constants_1[bit32.rrotate(bit32.band(v1692, 1047552), 10)];
                    if v1691 then
                        return v1555(v1691, v1543(nil, v1694), v1695);
                    else
                        return v1555(nil, v1543(nil, v1694), v1695);
                    end;
                elseif v1693 == 3 then
                    local v1696 = l_constants_1[bit32.rrotate(bit32.band(v1692, 1047552), 10)];
                    local v1697 = l_constants_1[bit32.band(v1692, 1023)];
                    if v1691 then
                        return v1555(v1691, v1555(nil, v1543(nil, v1694), v1696), v1697);
                    else
                        return v1555(nil, v1555(nil, v1543(nil, v1694), v1696), v1697);
                    end;
                elseif v1691 then
                    return v1543(v1691, v1694);
                else
                    return v1543(nil, v1694);
                end;
            end;
            local function v1715(v1699, v1700, _, v1702)
                local v1703 = {};
                local v1704;
                if v1389[v1699] then
                    v1704 = v1388(v1699, v1389[v1699]);
                else
                    local v1705 = v1355[v1699];
                    if not v1705 then
                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1699) .. "]");
                        v1705 = v1375(v1699, (v1283(true)));
                    end;
                    v1704 = v1705;
                end;
                if v1331[v1704] then
                    v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                else
                    v1331[v1704] = true;
                end;
                local l_v1704_0 = v1704;
                v1704 = table.clone(l_v1704_0.reads);
                local _ = table.clone(l_v1704_0.writes);
                local _ = table.clone(l_v1704_0.contributors);
                local v1709 = v1702 and 2 or 1;
                for v1710 = v1709, v1700 do
                    local v1711 = v1699 + v1710;
                    local v1712;
                    if v1389[v1711] then
                        v1712 = v1388(v1711, v1389[v1711]);
                    else
                        local v1713 = v1355[v1711];
                        if not v1713 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1711) .. "]");
                            v1713 = v1375(v1711, (v1283(true)));
                        end;
                        v1712 = v1713;
                    end;
                    if v1331[v1712] then
                        v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    else
                        v1331[v1712] = true;
                    end;
                    table.insert(v1703, v1712);
                end;
                local v1714 = v1297(l_v1704_0, v1703, v1702 and true or false);
                return v1375(v1699, v1714);
            end;
            local v1716 = {};
            local function _(v1717)
                v1390[v1717] = true;
                v1716[v1717] = true;
            end;
            local function _(v1719)
                v1390[v1719] = nil;
                v1716[v1719] = nil;
            end;
            local function v1796(v1721, v1722)
                local v1723 = {};
                local v1724 = nil;
                local v1725 = nil;
                if v1722.debug_name and v1129.use_proto_debugnames then
                    v1724 = v1722.debug_name;
                    v1725 = true;
                else
                    local v1726 = "var" .. tostring(v1195);
                    local v1727 = v1213[v1726];
                    local l_v1726_0 = v1726;
                    local v1729 = v1727 or 1;
                    while v1206[l_v1726_0] or v1141[l_v1726_0] do
                        v1729 = v1729 + 1;
                        l_v1726_0 = v1726 .. "_" .. v1729;
                    end;
                    v1213[v1726] = v1729;
                    local l_l_v1726_0_0 = l_v1726_0;
                    v1195 = v1195 + 1;
                    v1724 = l_l_v1726_0_0;
                end;
                local l_v1223_4 = v1223;
                local l_v1724_0 = v1724;
                local v1733 = v1213[l_v1724_0];
                local l_l_v1724_0_0 = l_v1724_0;
                local v1735 = v1733 or 1;
                while v1206[l_l_v1724_0_0] or v1141[l_l_v1724_0_0] do
                    v1735 = v1735 + 1;
                    l_l_v1724_0_0 = l_v1724_0 .. "_" .. v1735;
                end;
                v1213[l_v1724_0] = v1735;
                l_v1223_4 = l_v1223_4(l_l_v1724_0_0, {
                    beginning = v1721, 
                    ending = v1721
                }, {});
                local v1736 = v1375(v1721, {
                    t = "function", 
                    reads = {}, 
                    writes = {}, 
                    contributors = v1723, 
                    varname = l_v1223_4
                });
                l_v1724_0 = v1203[#v1203];
                v1516(v1721, v1736);
                if not v1389[v1721] then
                    v1417({
                        beginning = v1721, 
                        ending = v1721
                    }, v1736, {
                        l_v1223_4
                    });
                end;
                v1733 = v1203[#v1203];
                l_l_v1724_0_0 = #v1203;
                v1487 = true;
                v1735 = false;
                local v1737 = {};
                for v1738 = v1359 + 1, #v1362 do
                    local v1739 = v1362[v1738];
                    local l_inst_37 = v1739.inst;
                    if v1739.opinfo.opname == "CAPTURE" then
                        local v1741 = bit32.band(bit32.rshift(l_inst_37, 8), 255);
                        if v1741 == 2 then
                            if v1347 then
                                local v1742 = v1347.upvalues[bit32.band(bit32.rshift(l_inst_37, 16), 255)];
                                assert(v1742.name.attributes.is_upvalue);
                                table.insert(v1737, {
                                    name = v1742.name, 
                                    access = v1742.access == "readonly" and "copied, readonly" or v1742.access == "read and write" and "copied, read and write" or v1742.access
                                });
                            else
                                local v1743 = "UNK" .. math.random(1, 1000000000);
                                v1371(l_prefix_warning_1 .. ": Malformed upref, replacing with `" .. v1743 .. "`");
                                table.insert(v1737, {
                                    name = v1223(v1743, {
                                        beginning = -1, 
                                        ending = -1
                                    }, {}), 
                                    access = "copied, unknown"
                                });
                            end;
                        elseif not (v1741 ~= 0) or v1741 == 1 then
                            local v1744 = bit32.band(bit32.rshift(l_inst_37, 16), 255);
                            if v1744 == v1721 then
                                v1735 = true;
                                local v1745;
                                if v1389[v1721] then
                                    v1745 = v1388(v1721, v1389[v1721]);
                                else
                                    local v1746 = v1355[v1721];
                                    if not v1746 then
                                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1721) .. "]");
                                        v1746 = v1375(v1721, (v1283(true)));
                                    end;
                                    v1745 = v1746;
                                end;
                                if v1745.t ~= "name" then
                                    local l_v1417_0 = v1417;
                                    local v1748 = {
                                        beginning = v1721, 
                                        ending = v1721
                                    };
                                    local l_v1736_0 = v1736;
                                    local v1750 = {};
                                    local v1751 = {
                                        beginning = v1721, 
                                        ending = v1721
                                    };
                                    local v1752 = {};
                                    local l_v1223_5 = v1223;
                                    local v1754 = "var" .. tostring(v1195);
                                    local v1755 = v1213[v1754];
                                    local l_v1754_0 = v1754;
                                    local v1757 = v1755 or 1;
                                    while v1206[l_v1754_0] or v1141[l_v1754_0] do
                                        v1757 = v1757 + 1;
                                        l_v1754_0 = v1754 .. "_" .. v1757;
                                    end;
                                    v1213[v1754] = v1757;
                                    local l_l_v1754_0_0 = l_v1754_0;
                                    v1195 = v1195 + 1;
                                    local v1759 = l_v1223_5(l_l_v1754_0_0, v1751, v1752);
                                    v6(v1750, 1, v1759);
                                    l_v1417_0(v1748, l_v1736_0, v1750);
                                    if v1389[v1721] then
                                        v1745 = v1388(v1721, v1389[v1721]);
                                    else
                                        v1748 = v1355[v1721];
                                        if not v1748 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1721) .. "]");
                                            v1748 = v1375(v1721, (v1283(true)));
                                        end;
                                        v1745 = v1748;
                                    end;
                                    l_v1417_0 = v1357[v1358];
                                    if l_v1417_0 then
                                        for _ = #l_v1417_0, 1, -1 do
                                            error("message");
                                        end;
                                    end;
                                end;
                                v1390[v1721] = true;
                                v1716[v1721] = true;
                                local l_name_5 = v1745.name;
                                if v1741 == 0 then
                                    if not l_name_5.attributes.is_upvalue then
                                        l_name_5.attributes.is_upvalue = "read";
                                    end;
                                    table.insert(v1737, {
                                        name = l_name_5, 
                                        access = "readonly"
                                    });
                                else
                                    l_name_5.attributes.is_upvalue = "write";
                                    table.insert(v1737, {
                                        name = l_name_5, 
                                        access = "read and write"
                                    });
                                end;
                            else
                                local v1762;
                                if v1389[v1744] then
                                    v1762 = v1388(v1744, v1389[v1744]);
                                else
                                    local v1763 = v1355[v1744];
                                    if not v1763 then
                                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1744) .. "]");
                                        v1763 = v1375(v1744, (v1283(true)));
                                    end;
                                    v1762 = v1763;
                                end;
                                if v1762.t ~= "name" then
                                    local l_v1425_0 = v1425;
                                    local v1765 = {
                                        beginning = v1744, 
                                        ending = v1744
                                    };
                                    local v1766 = {};
                                    local v1767 = {
                                        beginning = v1744, 
                                        ending = v1744
                                    };
                                    local v1768 = {};
                                    local l_v1223_6 = v1223;
                                    local v1770 = "var" .. tostring(v1195);
                                    local v1771 = v1213[v1770];
                                    local l_v1770_0 = v1770;
                                    local v1773 = v1771 or 1;
                                    while v1206[l_v1770_0] or v1141[l_v1770_0] do
                                        v1773 = v1773 + 1;
                                        l_v1770_0 = v1770 .. "_" .. v1773;
                                    end;
                                    v1213[v1770] = v1773;
                                    local l_l_v1770_0_0 = l_v1770_0;
                                    v1195 = v1195 + 1;
                                    local v1775 = l_v1223_6(l_l_v1770_0_0, v1767, v1768);
                                    v6(v1766, 1, v1775);
                                    l_v1425_0(v1765, v1766);
                                    if v1389[v1744] then
                                        v1762 = v1388(v1744, v1389[v1744]);
                                    else
                                        v1765 = v1355[v1744];
                                        if not v1765 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v1744) .. "]");
                                            v1765 = v1375(v1744, (v1283(true)));
                                        end;
                                        v1762 = v1765;
                                    end;
                                end;
                                v1390[v1744] = true;
                                v1716[v1744] = true;
                                if v1762.name.init_expr then
                                    v1723[v1762.name.init_expr] = true;
                                end;
                                if v1741 == 0 then
                                    if not v1762.name.attributes.is_upvalue then
                                        v1762.name.attributes.is_upvalue = "read";
                                    end;
                                    table.insert(v1737, {
                                        name = v1762.name, 
                                        access = "readonly"
                                    });
                                else
                                    v1762.name.attributes.is_upvalue = "write";
                                    table.insert(v1737, {
                                        name = v1762.name, 
                                        access = "read and write"
                                    });
                                end;
                            end;
                        else
                            error((("Unknown LCT %*"):format(v1741)));
                        end;
                    else
                        v1359 = v1738 - 1;
                        break;
                    end;
                end;
                if #v1737 > 0 then
                    table.move(v1737, 1, #v1737, 0, v1737);
                    table.remove(v1737, #v1737);
                end;
                if l_v1724_0 ~= v1733 then
                    local l_v1203_0 = v1203;
                    local v1777 = table.remove(v1203, l_l_v1724_0_0);
                    assert(v1777);
                    table.insert(l_v1203_0, v1777);
                end;
                local l_v1203_1 = v1203;
                v1203 = {};
                local v1779 = {};
                for v1780 = 0, v1722.params_count - 1 do
                    local l_v1223_7 = v1223;
                    local l_name_6 = l_v1223_4.name;
                    local v1783 = "arg" .. tostring(v1207);
                    if v1129.exact_argument_names then
                        v1783 = l_name_6 .. "_" .. v1783;
                    end;
                    local l_v1783_0 = v1783;
                    local v1785 = v1213[l_v1783_0];
                    local l_l_v1783_0_0 = l_v1783_0;
                    local v1787 = v1785 or 1;
                    while v1206[l_l_v1783_0_0] or v1141[l_l_v1783_0_0] do
                        v1787 = v1787 + 1;
                        l_l_v1783_0_0 = l_v1783_0 .. "_" .. v1787;
                    end;
                    v1213[l_v1783_0] = v1787;
                    v1783 = l_l_v1783_0_0;
                    v1207 = v1207 + 1;
                    l_v1223_7 = l_v1223_7(v1783, {
                        beginning = v1780, 
                        ending = v1780
                    }, v1779);
                    l_v1223_7.func_name = l_v1223_4;
                    local _ = l_v1223_7;
                end;
                v1207 = 1;
                local l_v1345_0 = v1345;
                local v1790 = {
                    t = "function", 
                    reads = {}, 
                    writes = {}, 
                    contributors = v1723, 
                    is_self_referencing = v1735, 
                    name = v1724, 
                    varname = l_v1223_4, 
                    name_known = v1725, 
                    args = v1779, 
                    is_vararg = v1722.is_vararg, 
                    line_defined = v1722.line_defined, 
                    upvalues_count = v1722.upvalues_count, 
                    upvalues = v1737, 
                    ast = l_v1345_0(v1722, {
                        args = v1779, 
                        upvalues = v1737, 
                        name = v1724
                    })
                };
                table.clear(v1736);
                for v1791, v1792 in pairs(v1790) do
                    v1736[v1791] = v1792;
                end;
                for _, v1794 in ipairs(v1779) do
                    local l_name_7 = v1794.name;
                    if not v1206[l_name_7] then
                        error((("[free] Variable %* not allocated"):format(v1794.name)));
                    end;
                    v1206[l_name_7] = nil;
                end;
                l_v1223_4.init_expr = v1736;
                l_v1223_4.var_num = 1;
                v1203 = l_v1203_1;
                return v1736;
            end;
            if v1354 == 0 and not l_code_1[0] then
                v1371((("%*: Empty proto"):format(l_prefix_warning_1)));
                v300 = l_v300_0;
                return v1203;
            else
                if v1347 and v1347.args then
                    for v1797, v1798 in ipairs(v1347.args) do
                        v1389[v1797 - 1] = v1798;
                    end;
                end;
                local function _(v1799)
                    local v1800 = v181[v1799];
                    if not v1800 then
                        v1358 = v1358 + 1;
                        return;
                    elseif v1800.aux then
                        v1358 = v1358 + 2;
                        return;
                    else
                        v1358 = v1358 + 1;
                        return;
                    end;
                end;
                local function _()
                    local v1802 = l_code_1[v1358 + 1];
                    if not v1802 then
                        error("Expected aux");
                    end;
                    return v1802;
                end;
                local function _(v1804)
                    local l_condition_0 = v1804.condition;
                    assert(l_condition_0);
                    v1804.condition = v215[l_condition_0];
                end;
                local function _(v1807)
                    local l_condition_1 = v1807.condition;
                    local l_lhs_0 = v1807.lhs;
                    local l_rhs_0 = v1807.rhs;
                    assert(l_condition_1);
                    assert(l_lhs_0);
                    assert(l_rhs_0);
                    v1807.lhs = l_rhs_0;
                    v1807.rhs = l_lhs_0;
                    v1807.condition = v216[l_condition_1];
                end;
                local v1812 = {};
                local v1813 = {};
                local _ = function(v1814, _, v1816)
                    v1813[v1814] = v1816;
                end;
                local function v1824(v1818)
                    if v1818.condition then
                        local l_code_2 = v1818.code;
                        local l_opname_1 = l_code_2.opname;
                        if not (l_opname_1 ~= "JUMPXEQKNIL" and l_opname_1 ~= "JUMPXEQKB" and l_opname_1 ~= "JUMPXEQKN") or l_opname_1 == "JUMPXEQKS" then
                            local l_rhs_1 = v1818.rhs;
                            assert(l_rhs_1);
                            return bit32.band(bit32.rshift(l_code_2.inst, 8), 255), l_rhs_1;
                        elseif not (l_opname_1 ~= "JUMPIFEQ" and l_opname_1 ~= "JUMPIFLE" and l_opname_1 ~= "JUMPIFLT" and l_opname_1 ~= "JUMPIFNOTEQ" and l_opname_1 ~= "JUMPIFNOTLE") or l_opname_1 == "JUMPIFNOTLT" then
                            local l_aux_8 = l_code_2.aux;
                            assert(l_aux_8);
                            local _ = v1818.rhs;
                            return bit32.band(bit32.rshift(l_code_2.inst, 8), 255), l_aux_8;
                        elseif not (l_opname_1 ~= "JUMPIF") or l_opname_1 == "JUMPIFNOT" then
                            return (bit32.band(bit32.rshift(l_code_2.inst, 8), 255));
                        elseif not (l_opname_1 ~= "JUMP" and l_opname_1 ~= "JUMPBACK") or l_opname_1 == "JUMPX" then
                            return;
                        else
                            error((("Unknown visitor %*"):format((tostring(l_opname_1)))));
                            return;
                        end;
                    else
                        return;
                    end;
                end;
                v1348:end_benchmark("Initialization");
                v1348:start_benchmark("Initial Processing");
                local v1825 = 1;
                local v1826 = 0;
                local v1827 = {};
                local v1828 = {};
                local function _(v1829)
                    table.insert(v1362, v1829);
                    v1827[v1829.code_index] = v1829.actual_code_index;
                    v1828[v1829.index] = v1829.actual_index;
                end;
                while v1358 <= v1354 do
                    local v1831 = l_code_1[v1358];
                    local v1832 = bit32.band(v1831, 255);
                    v1359 = #v1362 + 1;
                    local v1833 = v181[v1832];
                    if not v1833 then
                        local v1834 = ("Unknown opcode 0x%* (%* reversed: 0x%*)"):format(v64[bit32.band(v1831, 255)], v16, v64[v17[bit32.band(v1831, 255)]]);
                        error(v1834);
                        v551 = v551 + 1;
                        local v1835 = v181[v1832];
                        if not v1835 then
                            v1358 = v1358 + 1;
                        elseif v1835.aux then
                            v1358 = v1358 + 2;
                        else
                            v1358 = v1358 + 1;
                        end;
                    else
                        local l_opname_2 = v1833.opname;
                        local v1837 = {
                            index = v1359, 
                            code_index = v1358, 
                            actual_index = v1825, 
                            actual_code_index = v1826, 
                            opinfo = v1833, 
                            opname = l_opname_2, 
                            opcode = v1832, 
                            inst = v1831, 
                            aux = if v1833.aux then l_code_1[v1358 + 1] else nil, 
                            size = v1833.aux and 2 or 1
                        };
                        table.insert(v1362, v1837);
                        v1827[v1837.code_index] = v1837.actual_code_index;
                        v1828[v1837.index] = v1837.actual_index;
                        v1360[v1358] = v1359;
                        v1361[v1359] = v1358;
                        if v189[v1832] then
                            if not (l_opname_2 ~= "JUMPXEQKNIL" and l_opname_2 ~= "JUMPXEQKB" and l_opname_2 ~= "JUMPXEQKN") or l_opname_2 == "JUMPXEQKS" then
                                buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v1831, 16), 65535)));
                                local v1838 = buffer.readi16(v44, 0);
                                local v1839 = l_code_1[v1358 + 1];
                                if not v1839 then
                                    error("Expected aux");
                                end;
                                local l_v1839_0 = v1839;
                                v1839 = nil;
                                v1839 = if l_opname_2 == "JUMPXEQKNIL" then v1375(nil, (v1283(true))) else if l_opname_2 == "JUMPXEQKB" then v1560(nil, bit32.band(l_v1839_0, 1) > 0) else v1548(nil, l_constants_1[bit32.band(l_v1839_0, 16777215)]);
                                local v1841 = false;
                                if bit32.band(l_v1839_0, 2147483648) > 0 then
                                    v1841 = true;
                                end;
                                v1813[v1359] = {
                                    code = v1837, 
                                    index = v1359, 
                                    destination = v1358 + v1838 + 1, 
                                    condition = v1841 and "~=" or "==", 
                                    lhs = nil, 
                                    rhs = v1839
                                };
                            elseif not (l_opname_2 ~= "JUMPIFEQ" and l_opname_2 ~= "JUMPIFLE" and l_opname_2 ~= "JUMPIFLT" and l_opname_2 ~= "JUMPIFNOTEQ" and l_opname_2 ~= "JUMPIFNOTLE") or l_opname_2 == "JUMPIFNOTLT" then
                                buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v1831, 16), 65535)));
                                local v1842 = buffer.readi16(v44, 0);
                                local v1843 = nil;
                                local v1844 = string.sub(l_opname_2, #l_opname_2 - 1, #l_opname_2);
                                v1843 = if string.match(l_opname_2, "NOT") then v1844 == "EQ" and "~=" or v1844 == "LE" and ">" or ">=" else v1844 == "EQ" and "==" or v1844 == "LE" and "<=" or "<";
                                assert(v1843, l_opname_2);
                                v1813[v1359] = {
                                    code = v1837, 
                                    index = v1359, 
                                    destination = v1358 + v1842 + 1, 
                                    condition = v1843
                                };
                            elseif not (l_opname_2 ~= "JUMPIF") or l_opname_2 == "JUMPIFNOT" then
                                buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v1831, 16), 65535)));
                                v1813[v1359] = {
                                    code = v1837, 
                                    index = v1359, 
                                    destination = v1358 + buffer.readi16(v44, 0) + 1, 
                                    condition = l_opname_2 == "JUMPIFNOT" and "not exist" or "exist"
                                };
                            elseif not (l_opname_2 ~= "JUMP" and l_opname_2 ~= "JUMPBACK") or l_opname_2 == "JUMPX" then
                                local v1845;
                                if l_opname_2 == "JUMPX" then
                                    buffer.writeu32(v44, 0, (bit32.rshift(v1831, 8)));
                                    v1845 = bit32.rshift(buffer.readi32(v44, 1), 16);
                                else
                                    buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v1831, 16), 65535)));
                                    v1845 = buffer.readi16(v44, 0);
                                end;
                                v1813[v1359] = {
                                    code = v1837, 
                                    index = v1359, 
                                    destination = v1358 + v1845 + 1
                                };
                            elseif l_opname_2 == "FORNLOOP" then
                                local v1846 = bit32.band(bit32.rshift(v1831, 8), 255);
                                buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v1831, 16), 65535)));
                                local v1847 = {
                                    code = v1837, 
                                    index = v1359, 
                                    destination = v1358 + buffer.readi16(v44, 0) + 1
                                };
                                local v1848 = {
                                    type = "numeric", 
                                    variable_count = 1
                                };
                                local v1849 = v1846 + 2;
                                v1848.variables_reg_range = {
                                    beginning = v1849, 
                                    ending = v1849
                                };
                                local v1850 = {};
                                local v1851 = v1846 + 2;
                                v1850.register_range = if v1851 then {
                                    beginning = v1846, 
                                    ending = v1851
                                } else {
                                    beginning = v1846, 
                                    ending = v1846
                                };
                                v1850.index_reg = v1846 + 2;
                                v1850.end_reg = v1846;
                                v1850.step_reg = v1846 + 1;
                                v1848.args = v1850;
                                v1847.for_info = v1848;
                                v1813[v1359] = v1847;
                            elseif l_opname_2 == "FORGLOOP" then
                                local v1852 = bit32.band(bit32.rshift(v1831, 8), 255);
                                buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v1831, 16), 65535)));
                                local v1853 = buffer.readi16(v44, 0);
                                local v1854 = l_code_1[v1358 + 1];
                                if not v1854 then
                                    error("Expected aux");
                                end;
                                v1854 = bit32.band(v1854, 255);
                                assert(v1854 > 0);
                                local v1855 = {
                                    code = v1837, 
                                    index = v1359, 
                                    destination = v1358 + v1853 + 1
                                };
                                local v1856 = {
                                    type = "generic", 
                                    variable_count = v1854
                                };
                                local v1857 = v1852 + 3;
                                local v1858 = v1852 + 2 + v1854;
                                v1856.variables_reg_range = if v1858 then {
                                    beginning = v1857, 
                                    ending = v1858
                                } else {
                                    beginning = v1857, 
                                    ending = v1857
                                };
                                local v1859 = {};
                                v1858 = v1852 + 2;
                                v1859.register_range = if v1858 then {
                                    beginning = v1852, 
                                    ending = v1858
                                } else {
                                    beginning = v1852, 
                                    ending = v1852
                                };
                                v1859.generator_reg = v1852;
                                v1859.state_reg = v1852 + 1;
                                v1859.index_reg = v1852 + 2;
                                v1856.args = v1859;
                                v1856.code = v1837;
                                v1855.for_info = v1856;
                                v1813[v1359] = v1855;
                            elseif l_opname_2 == "LOADB" then
                                local v1860 = bit32.band(bit32.rshift(v1831, 24), 255);
                                if v1860 ~= 0 then
                                    local v1861 = {
                                        index = v1359, 
                                        code_index = v1358, 
                                        actual_index = v1825, 
                                        actual_code_index = v1826
                                    };
                                    local l_JUMP_0 = v180.JUMP;
                                    if not l_JUMP_0 then
                                        error((("Unknown opname %*"):format("JUMP")));
                                    end;
                                    v1861.opinfo = l_JUMP_0;
                                    v1861.opname = "JUMP";
                                    local l_JUMP_1 = v180.JUMP;
                                    if not l_JUMP_1 then
                                        error((("Unknown opname %*"):format("JUMP")));
                                    end;
                                    v1861.opcode = l_JUMP_1.opcode;
                                    local l_JUMP_2 = v180.JUMP;
                                    if not l_JUMP_2 then
                                        error((("Unknown opname %*"):format("JUMP")));
                                    end;
                                    v1861.inst = bit32.bor(l_JUMP_2.opcode, (bit32.lshift(v1860, 16)));
                                    v1861.size = 1;
                                    table.insert(v1362, v1861);
                                    v1359 = v1359 + 1;
                                    v1361[v1359] = v1358;
                                    v1813[v1359] = {
                                        code = v1861, 
                                        index = v1359, 
                                        destination = v1358 + v1860 + 1
                                    };
                                end;
                            end;
                        end;
                        v1825 = v1825 + 1;
                        v1826 = v1826 + v1837.size;
                        local v1865 = v181[v1832];
                        if not v1865 then
                            v1358 = v1358 + 1;
                        elseif v1865.aux then
                            v1358 = v1358 + 2;
                        else
                            v1358 = v1358 + 1;
                        end;
                    end;
                end;
                v1348:end_benchmark("Initial Processing");
                v1348:start_benchmark("Initial Labeling");
                for _, v1867 in pairs(v1813) do
                    v1280[v1867.code.code_index] = v1281();
                    assert(v1867.destination);
                    v1867.destination = v1360[v1867.destination];
                    assert(v1867.destination, "Broken control flow");
                    local v1868 = v1812[v1867.destination];
                    if v1868 then
                        table.insert(v1868, v1867);
                    else
                        v1812[v1867.destination] = {
                            v1867
                        };
                    end;
                end;
                v1348:end_benchmark("Initial Labeling");
                v1348:start_benchmark("Block Loading");
                v1359 = 0;
                v1358 = 0;
                local v1869 = {};
                local v1870 = {};
                local v1871 = false;
                local v1872 = {};
                local v1873 = {};
                local v1874 = 1;
                for v1875, v1876 in ipairs(v1362) do
                    local v1877 = v1813[v1875];
                    if v1877 then
                        if v1873[1] and v1873[1] == v1876 then
                            table.remove(v1873, 1);
                            error("Shouldn't happen");
                        end;
                        local v1878 = v1812[v1875];
                        if v1878 and v1874 ~= v1875 then
                            assert(#v1878 > 0);
                            assert(v1874 < v1875);
                            table.insert(v1872, {
                                insts = v1873, 
                                index = v1874
                            });
                            table.insert(v1872, {
                                insts = {}, 
                                index = v1875, 
                                visitor = v1877
                            });
                        else
                            table.insert(v1872, {
                                insts = v1873, 
                                index = v1874, 
                                visitor = v1877
                            });
                        end;
                        v1874 = v1875 + 1;
                        v1873 = {};
                    elseif v1812[v1875] then
                        local v1879 = false;
                        if #v1873 == 0 then
                            v1879 = true;
                            table.insert(v1873, v1876);
                        end;
                        table.insert(v1872, {
                            insts = v1873, 
                            index = v1874
                        });
                        if v1874 == v1875 then
                            if v1879 then
                                v1874 = v1875 + 1;
                                v1873 = {};
                            else
                                v1874 = v1875 + 1;
                                v1873 = {
                                    v1876
                                };
                            end;
                        else
                            v1874 = v1875;
                            v1873 = {
                                v1876
                            };
                        end;
                    else
                        table.insert(v1873, v1876);
                    end;
                end;
                if v1874 <= #v1362 then
                    table.insert(v1872, {
                        insts = v1873, 
                        index = v1874
                    });
                end;
                local v1880 = {};
                local v1881 = {};
                local v1882 = {};
                for _, v1884 in ipairs(v1872) do
                    local l_visitor_0 = v1884.visitor;
                    local v1886 = nil;
                    if l_visitor_0 then
                        v1886 = l_visitor_0.condition;
                        v1882[v1884] = l_visitor_0.destination;
                    end;
                    local v1887 = {
                        insts = v1884.insts, 
                        index = v1884.index, 
                        visitor = l_visitor_0, 
                        children = {}
                    };
                    v1880[v1884.index] = v1887;
                    table.insert(v1881, v1887);
                end;
                for v1888, v1889 in ipairs(v1872) do
                    local v1890 = v1882[v1889];
                    if v1890 then
                        assert(v1889.visitor);
                        local v1891 = v1880[v1890];
                        assert(v1891);
                        local v1892 = v1880[v1889.index];
                        local l_children_0 = v1892.children;
                        table.insert(l_children_0, v1891);
                        if v1889.visitor.condition then
                            local v1894 = v1872[v1888 + 1];
                            if v1894 then
                                local v1895 = v1880[v1894.index];
                                if v1895 ~= v1892 and v1895 ~= v1891 then
                                    table.insert(l_children_0, v1895);
                                end;
                            end;
                        end;
                    else
                        local v1896 = v1872[v1888 + 1];
                        if v1896 then
                            table.insert(v1880[v1889.index].children, v1880[v1896.index]);
                        end;
                    end;
                end;
                local v1897 = {};
                local v1898 = table.clone(v1364);
                local v1899 = table.clone(v1364);
                local v1900 = {};
                local function v1901()

                end;
                local l_v1900_0 = v1900 --[[ copy: 109 -> 170 ]];
                local function v1906(v1903)
                    local l_type_2 = v1903.type;
                    if l_type_2 == "ifthen" then
                        if v1364[v1903.data.pass].jump then
                            l_v1900_0[v1903] = true;
                            return;
                        end;
                    elseif l_type_2 == "ifthenelse" then
                        local l_else__0 = v1903.data.else_;
                        assert(l_else__0);
                        if v1364[l_else__0].jump then
                            l_v1900_0[v1903] = true;
                            return;
                        end;
                    end;
                    l_v1900_0[v1903] = nil;
                end;
                local function v1910(v1907, v1908)
                    if v1869[v1908.index] then
                        local v1909 = v1870[v1908.index];
                        if v1909 then
                            if not table.find(v1909, v1907) then
                                table.insert(v1909, v1907);
                                return;
                            else
                                error("TEMPORARY thing");
                                return;
                            end;
                        else
                            v1870[v1908.index] = {
                                v1907
                            };
                        end;
                    end;
                end;
                local l_v1898_0 = v1898 --[[ copy: 107 -> 171 ]];
                local l_v1897_0 = v1897 --[[ copy: 106 -> 172 ]];
                local l_v1910_0 = v1910 --[[ copy: 112 -> 173 ]];
                local function v1918(v1914, v1915)
                    table.insert(v1364, v1914);
                    table.insert(l_v1898_0, v1914);
                    if v1914.index > 0 then
                        l_v1897_0[v1914.index] = v1914;
                    end;
                    if v1915 then
                        for _, v1917 in ipairs(v1915) do
                            l_v1910_0(v1914, v1917);
                        end;
                    end;
                end;
                local l_v1901_0 = v1901 --[[ copy: 110 -> 174 ]];
                local function v1924(v1920, v1921)
                    local l_hl_index_0 = v1920.hl_index;
                    assert(l_hl_index_0 == v1921.hl_index);
                    local l_index_0 = v1920.index;
                    assert(l_index_0 == v1921.index);
                    v1364[l_hl_index_0] = v1921;
                    l_v1898_0[l_hl_index_0] = v1921;
                    if l_index_0 > 0 then
                        assert(l_v1897_0[l_index_0]);
                        l_v1897_0[l_index_0] = v1921;
                    end;
                    l_v1901_0();
                end;
                for _, v1926 in ipairs(v1881) do
                    assert(v1926.index == v1880[v1926.index].index);
                    local l_insts_0 = v1880[v1926.index].insts;
                    local v1928 = {
                        code_index = v1361[v1926.index], 
                        index = v1926.index, 
                        actual_code_index = v1827[v1361[v1926.index]], 
                        actual_index = v1828[v1926.index], 
                        hl_index = #v1364 + 1, 
                        length = if v1926.visitor then #l_insts_0 + 1 else #l_insts_0, 
                        type = "single", 
                        data = l_insts_0, 
                        parents = {}, 
                        children = {}, 
                        jumped_to_by = {}, 
                        _visitor = v1926.visitor
                    };
                    v1918(v1928);
                    table.insert(v1899, v1928);
                    v1869[v1926.index] = v1928;
                end;
                local l_v1918_0 = v1918 --[[ copy: 113 -> 175 ]];
                local function v1931()
                    local v1930 = {
                        code_index = 0, 
                        index = 0, 
                        actual_code_index = 0, 
                        actual_index = 0, 
                        hl_index = #v1364 + 1, 
                        length = 0, 
                        type = "single", 
                        data = {}, 
                        parents = {}, 
                        children = {}, 
                        jumped_to_by = {}
                    };
                    l_v1918_0(v1930);
                    return v1930;
                end;
                local function v1935(v1932, v1933)
                    assert(not v1932.jump);
                    v1932.jump = {
                        type = "goto", 
                        destination = v1933
                    };
                    local v1934 = v1364[v1933];
                    assert(v1934);
                    table.insert(v1869[v1934.index].jumped_to_by, v1932.hl_index);
                end;
                local function v1942(v1936)
                    local l_jump_0 = v1936.jump;
                    assert(l_jump_0);
                    local v1938 = v1364[l_jump_0.destination];
                    assert(v1938);
                    local l_hl_index_1 = v1936.hl_index;
                    local l_jumped_to_by_0 = v1869[v1938.index].jumped_to_by;
                    local v1941 = table.find(l_jumped_to_by_0, l_hl_index_1);
                    assert(v1941);
                    table.remove(l_jumped_to_by_0, v1941);
                end;
                local function v1949(v1943)
                    local l_jump_1 = v1943.jump;
                    assert(l_jump_1);
                    local v1945 = v1364[l_jump_1.destination];
                    assert(v1945);
                    local l_hl_index_2 = v1943.hl_index;
                    local l_jumped_to_by_1 = v1869[v1945.index].jumped_to_by;
                    local v1948 = table.find(l_jumped_to_by_1, l_hl_index_2);
                    assert(v1948);
                    table.remove(l_jumped_to_by_1, v1948);
                    v1943.jump = nil;
                end;
                local function v1957(v1950, v1951)
                    local l_jump_2 = v1950.jump;
                    assert(l_jump_2);
                    local v1953 = v1364[l_jump_2.destination];
                    assert(v1953);
                    local l_hl_index_3 = v1950.hl_index;
                    local l_jumped_to_by_2 = v1869[v1953.index].jumped_to_by;
                    local v1956 = table.find(l_jumped_to_by_2, l_hl_index_3);
                    assert(v1956);
                    table.remove(l_jumped_to_by_2, v1956);
                    v1950.jump = nil;
                    assert(not v1950.jump);
                    v1950.jump = {
                        type = "goto", 
                        destination = v1951
                    };
                    l_jump_2 = v1364[v1951];
                    assert(l_jump_2);
                    table.insert(v1869[l_jump_2.index].jumped_to_by, v1950.hl_index);
                end;
                local l_v1931_0 = v1931 --[[ copy: 115 -> 176 ]];
                local function v1962(v1959)
                    local v1960 = l_v1931_0();
                    assert(not v1960.jump);
                    v1960.jump = {
                        type = "goto", 
                        destination = v1959
                    };
                    local v1961 = v1364[v1959];
                    assert(v1961);
                    table.insert(v1869[v1961.index].jumped_to_by, v1960.hl_index);
                    return v1960;
                end;
                local function v1964()
                    local v1963 = l_v1931_0();
                    v1963.jump = {
                        type = "break", 
                        destination = 0
                    };
                    return v1963;
                end;
                local function v1967(v1965, v1966)
                    if table.find(v1965.children, v1966.hl_index) then
                        return true;
                    else
                        return false;
                    end;
                end;
                local function v1971(v1968, v1969)
                    if table.find(v1968.children, v1969.hl_index) and true or false then
                        if not (v1969.index == v1968.index + v1968.length) or v1969.index == 0 then
                            return true;
                        else
                            local l__visitor_0 = v1968._visitor;
                            if l__visitor_0 and l__visitor_0.condition then
                                return true;
                            end;
                        end;
                    end;
                end;
                local function v1974(v1972, v1973)
                    assert(v1972);
                    assert(v1973);
                    assert(not table.find(v1364[v1973.hl_index].parents, v1972.hl_index));
                    assert(not table.find(v1364[v1972.hl_index].children, v1973.hl_index));
                    table.insert(v1972.children, v1973.hl_index);
                    table.insert(v1973.parents, v1972.hl_index);
                end;
                local function v1979(v1975, v1976)
                    assert(v1975);
                    assert(v1976);
                    local v1977 = table.find(v1975.children, v1976.hl_index);
                    assert(v1977);
                    local v1978 = table.find(v1976.parents, v1975.hl_index);
                    assert(v1978);
                    table.remove(v1975.children, v1977);
                    table.remove(v1976.parents, v1978);
                end;
                local l_v1979_0 = v1979 --[[ copy: 125 -> 177 ]];
                local function v1984(v1981)
                    for _, v1983 in ipairs(table.clone(v1981.children)) do
                        l_v1979_0(v1981, v1364[v1983]);
                    end;
                end;
                local function v1988(v1985)
                    for _, v1987 in ipairs(table.clone(v1985.parents)) do
                        l_v1979_0(v1364[v1987], v1985);
                    end;
                end;
                local l_v1988_0 = v1988 --[[ copy: 127 -> 178 ]];
                local l_v1984_0 = v1984 --[[ copy: 126 -> 179 ]];
                local function v1992(v1991)
                    l_v1988_0(v1991);
                    l_v1984_0(v1991);
                end;
                local function v1998(v1993, v1994, v1995)
                    assert(v1993);
                    assert(v1994);
                    assert(v1995);
                    local v1996 = table.find(v1993.children, v1994.hl_index);
                    assert(v1996);
                    local v1997 = table.find(v1994.parents, v1993.hl_index);
                    assert(v1997);
                    assert(not table.find(v1995.parents, v1993.hl_index));
                    table.remove(v1994.parents, v1997);
                    table.insert(v1995.parents, v1993.hl_index);
                    v1993.children[v1996] = v1995.hl_index;
                end;
                local function v2004(v1999, v2000, v2001)
                    assert(v1999);
                    assert(v2000);
                    assert(v2001);
                    local v2002 = table.find(v1999.parents, v2000.hl_index);
                    assert(v2002);
                    local v2003 = table.find(v2000.children, v1999.hl_index);
                    assert(v2003);
                    assert(not table.find(v2001.children, v1999.hl_index));
                    table.remove(v2000.children, v2003);
                    table.insert(v2001.children, v1999.hl_index);
                    v1999.parents[v2002] = v2001.hl_index;
                end;
                local l_v1897_1 = v1897 --[[ copy: 106 -> 180 ]];
                local function v2012(v2006, v2007)
                    local l__visitor_1 = v2006._visitor;
                    if l__visitor_1 and l__visitor_1.destination then
                        assert(table.find(v2006.children, l_v1897_1[l__visitor_1.destination].hl_index));
                    end;
                    if v2007 then
                        local v2009 = table.create(#v2006.children);
                        for _, v2011 in ipairs(v2006.children) do
                            if v1364[v2011].index > v2006.index then
                                table.insert(v2009, v2011);
                            end;
                        end;
                        return v2009;
                    else
                        return (table.clone(v2006.children));
                    end;
                end;
                local l_v2012_0 = v2012 --[[ copy: 131 -> 181 ]];
                local function v2018(v2014)
                    local v2015 = l_v2012_0(v2014);
                    if v2014.type == "ifthen" then
                        table.insert(v2015, v2014.data.pass);
                        return v2015;
                    elseif v2014.type == "ifthenelse" then
                        table.insert(v2015, v2014.data.pass);
                        table.insert(v2015, v2014.data.else_);
                        return v2015;
                    elseif v2014.type == "oneblockwhile" then
                        table.insert(v2015, v2014.data.code);
                        return v2015;
                    else
                        if v2014.type == "sequential" then
                            for _, v2017 in ipairs(v2014.data) do
                                table.insert(v2015, v2017);
                            end;
                        end;
                        return v2015;
                    end;
                end;
                local function v2019(v2020, v2021, v2022, v2023)
                    if v2020 == v2021 then
                        return true;
                    else
                        v2022 = v2022 or {};
                        assert(v2022);
                        for _, v2025 in ipairs((l_v2012_0(v2020, v2023))) do
                            if not v2022[v2025] then
                                v2022[v2025] = true;
                                if table.find(v2021.parents, v2025) then
                                    return true;
                                else
                                    return v2019(v1364[v2025], v2021, v2022);
                                end;
                            end;
                        end;
                        return false;
                    end;
                end;
                local l_v2018_0 = v2018 --[[ copy: 132 -> 182 ]];
                local function v2027(v2028, v2029, v2030)
                    if v2028 == v2029 then
                        return true;
                    else
                        v2030 = v2030 or {};
                        assert(v2030);
                        for _, v2032 in ipairs((l_v2018_0(v2028))) do
                            if not v2030[v2032] then
                                v2030[v2032] = true;
                                if table.find(v2029.parents, v2032) then
                                    return true;
                                else
                                    return v2027(v1364[v2032], v2029, v2030);
                                end;
                            end;
                        end;
                        return false;
                    end;
                end;
                local l_v1998_0 = v1998 --[[ copy: 129 -> 183 ]];
                local function v2039(v2034, v2035)
                    assert(v2034 ~= v2035);
                    assert(v2034.hl_index ~= v2035.hl_index);
                    local v2036 = table.clone(v2034.parents);
                    for v2037 in ipairs(v2036) do
                        local v2038 = v2036[v2037];
                        l_v1998_0(v1364[v2038], v2034, v2035);
                    end;
                end;
                local l_v2004_0 = v2004 --[[ copy: 130 -> 184 ]];
                local function v2046(v2041, v2042)
                    assert(v2041 ~= v2042);
                    assert(v2041.hl_index ~= v2042.hl_index);
                    local v2043 = table.clone(v2041.children);
                    for _, v2045 in ipairs(v2043) do
                        l_v2004_0(v1364[v2045], v2041, v2042);
                    end;
                end;
                local l_v2039_0 = v2039 --[[ copy: 135 -> 185 ]];
                local l_v2046_0 = v2046 --[[ copy: 136 -> 186 ]];
                local function v2051(v2049, v2050)
                    l_v2039_0(v2049, v2050);
                    l_v2046_0(v2049, v2050);
                end;
                for _, v2053 in ipairs(v1881) do
                    local v2054 = v1897[v2053.index];
                    assert(v2053);
                    for _, v2056 in ipairs(v2053.children) do
                        v1974(v2054, v1897[v2056.index]);
                    end;
                    table.clear(v2053.children);
                end;
                local function v2062(v2057, v2058, v2059, v2060, v2061)
                    return {
                        is_full_condition_t = true, 
                        type = v2057, 
                        condition = v2058, 
                        lhs = v2059, 
                        rhs = v2060, 
                        code = v2061
                    };
                end;
                local function v2066(v2063, v2064, v2065)
                    return {
                        is_full_condition_t = true, 
                        type = "and", 
                        condition = v2065 and "not exist" or "exist", 
                        lhs = v2063, 
                        rhs = v2064, 
                        code = nil
                    };
                end;
                local function v2070(v2067, v2068, v2069)
                    return {
                        is_full_condition_t = true, 
                        type = "or", 
                        condition = v2069 and "not exist" or "exist", 
                        lhs = v2067, 
                        rhs = v2068, 
                        code = nil
                    };
                end;
                local function v2087(v2071, v2072)
                    local v2073 = false;
                    local v2074 = false;
                    local v2075 = nil;
                    for _, v2077 in ipairs(v2071.parents) do
                        if table.find(v2072.parents, v2077) then
                            local v2078 = v1364[v2077];
                            local v2079;
                            if table.find(v2078.children, v2072.hl_index) and true or false then
                                if not (v2072.index == v2078.index + v2078.length) or v2072.index == 0 then
                                    v2079 = true;
                                    v2073 = true;
                                else
                                    local l__visitor_2 = v2078._visitor;
                                    if l__visitor_2 and l__visitor_2.condition then
                                        v2079 = true;
                                        v2073 = true;
                                    end;
                                end;
                            end;
                            if not v2073 then
                                if not v2073 then
                                    v2079 = nil;
                                end;
                            end;
                            v2073 = false;
                            if v2079 then
                                if v2075 then
                                    if v1364[v2077].index > v1364[v2075].index then
                                        v2075 = v2077;
                                    end;
                                else
                                    v2075 = v2077;
                                end;
                            end;
                        end;
                    end;
                    local v2081 = nil;
                    if v2075 then
                        v2081 = false;
                    else
                        v2081 = true;
                        for _, v2083 in ipairs(v2072.parents) do
                            if table.find(v2071.parents, v2083) then
                                local v2084 = v1364[v2083];
                                local v2085;
                                if table.find(v2084.children, v2071.hl_index) and true or false then
                                    if not (v2071.index == v2084.index + v2084.length) or v2071.index == 0 then
                                        v2085 = true;
                                        v2074 = true;
                                    else
                                        local l__visitor_3 = v2084._visitor;
                                        if l__visitor_3 and l__visitor_3.condition then
                                            v2085 = true;
                                            v2074 = true;
                                        end;
                                    end;
                                end;
                                if not v2074 then
                                    if not v2074 then
                                        v2085 = nil;
                                    end;
                                end;
                                v2074 = false;
                                if v2085 then
                                    assert(not v2075);
                                    v2075 = v2083;
                                end;
                            end;
                        end;
                    end;
                    return v1364[v2075], v2081;
                end;
                local l_v1901_1 = v1901 --[[ copy: 110 -> 187 ]];
                local l_v2087_0 = v2087 --[[ copy: 141 -> 188 ]];
                local l_v1979_1 = v1979 --[[ copy: 125 -> 189 ]];
                local function v2091(v2092, v2093, v2094)
                    local v2095 = false;
                    l_v1901_1();
                    local v2096, v2097 = l_v2087_0(v2092, v2093);
                    assert(v2096);
                    local v2098 = {
                        v2096
                    };
                    local v2099 = nil;
                    local v2100 = v2098[#v2098];
                    local v2101 = 0;
                    local v2102 = {};
                    while true do
                        if v1338[v2096.index] then
                            v2100 = v2098[#v2098];
                            break;
                        elseif #v2096.parents ~= 1 then
                            v2100 = v2098[#v2098];
                            if #v2096.parents ~= 0 then
                                local v2103 = v2098[#v2098];
                                if l_v2087_0(v2103, v2092) then
                                    local v2104, v2105, v2106, v2107 = v2091(v2103, v2092, true);
                                    v2099 = v2104;
                                    v2100 = v2105;
                                    v2101 = v2101 + v2107;
                                    for v2108 in pairs(v2106) do
                                        v2102[v2108] = true;
                                    end;
                                    break;
                                elseif l_v2087_0(v2103, v2093) then
                                    local v2109, v2110, v2111, v2112 = v2091(v2103, v2093);
                                    v2099 = v2109;
                                    v2100 = v2110;
                                    v2101 = v2101 + v2112;
                                    for v2113 in pairs(v2111) do
                                        v2102[v2113] = true;
                                    end;
                                    break;
                                else
                                    break;
                                end;
                            else
                                break;
                            end;
                        else
                            local v2114 = v1364[v2096.parents[1]];
                            if #v2114.children < 2 then
                                v2100 = v2098[#v2098];
                                break;
                            else
                                local v2115 = v2114.children[1];
                                if v2115 ~= v2092.hl_index and v2115 ~= v2093.hl_index then
                                    v2100 = v2098[#v2098];
                                    break;
                                else
                                    v2096 = v2114;
                                    table.insert(v2098, v2096);
                                    v2102[v2096] = true;
                                end;
                            end;
                        end;
                    end;
                    local v2116 = nil;
                    local v2117 = nil;
                    for v2118, v2119 in ipairs(v2098) do
                        assert(v2119._visitor);
                        assert(v2119._visitor.condition);
                        local v2120;
                        if table.find(v2119.children, v2093.hl_index) and true or false then
                            if not (v2093.index == v2119.index + v2119.length) or v2093.index == 0 then
                                v2120 = true;
                                v2095 = true;
                            else
                                local l__visitor_4 = v2119._visitor;
                                if l__visitor_4 and l__visitor_4.condition then
                                    v2120 = true;
                                    v2095 = true;
                                end;
                            end;
                        end;
                        if not v2095 then
                            if not v2095 then
                                v2120 = nil;
                            end;
                        end;
                        v2095 = false;
                        local v2122 = nil;
                        v2122 = not v2120 and v2118 == 1;
                        if v2094 then
                            v2120 = not v2120;
                        end;
                        if v2097 and v2118 == 1 then
                            v2122 = not v2122;
                        end;
                        local v2123, v2124 = v1824(v2119._visitor);
                        if v2122 or v2120 then
                            local l__visitor_5 = v2119._visitor;
                            local l_condition_2 = l__visitor_5.condition;
                            assert(l_condition_2);
                            l__visitor_5.condition = v215[l_condition_2];
                        end;
                        if v2116 then
                            local v2127 = {
                                is_full_condition_t = true, 
                                type = "reg", 
                                condition = v2119._visitor.condition, 
                                lhs = v2123, 
                                rhs = v2124, 
                                code = v2119.hl_index
                            };
                            if v2120 then
                                v2116 = {
                                    is_full_condition_t = true, 
                                    type = "and", 
                                    condition = v2122 and "not exist" or "exist", 
                                    lhs = v2127, 
                                    rhs = v2116, 
                                    code = nil
                                };
                            else
                                v2116 = {
                                    is_full_condition_t = true, 
                                    type = "or", 
                                    condition = v2122 and "not exist" or "exist", 
                                    lhs = v2127, 
                                    rhs = v2116, 
                                    code = nil
                                };
                            end;
                        else
                            v2116 = {
                                is_full_condition_t = true, 
                                type = "reg", 
                                condition = v2119._visitor.condition, 
                                lhs = v2123, 
                                rhs = v2124, 
                                code = v2119.hl_index
                            };
                        end;
                        v2101 = v2101 + v2119.length;
                        if v2117 then
                            l_v1979_1(v2119, v2117);
                            l_v1979_1(v2119, v1364[v2119.children[1]]);
                        end;
                        v2117 = v2119;
                    end;
                    if v2099 then
                        v2116 = {
                            is_full_condition_t = true, 
                            type = "or", 
                            condition = "exist", 
                            lhs = v2099, 
                            rhs = v2116, 
                            code = nil
                        };
                    end;
                    local v2128 = v2098[1];
                    l_v1979_1(v2128, v2092);
                    if v2092.hl_index ~= v2093.hl_index then
                        l_v1979_1(v2128, v2093);
                    end;
                    l_v1901_1();
                    return v2116, v2100, v2102, v2101;
                end;
                local v2129 = false;
                v1348:end_benchmark("Block Loading");
                v1348:start_benchmark("Control Flow Analysis");
                local function v2130(v2131, v2132, v2133)
                    local l_jump_3 = v2131.jump;
                    if l_jump_3 then
                        local l_index_1 = v1364[l_jump_3.destination].index;
                        if v2132[l_index_1] then
                            l_jump_3.type = "break";
                            local l_jump_4 = v2131.jump;
                            assert(l_jump_4);
                            local v2137 = v1364[l_jump_4.destination];
                            assert(v2137);
                            local l_hl_index_4 = v2131.hl_index;
                            local l_jumped_to_by_3 = v1869[v2137.index].jumped_to_by;
                            local v2140 = table.find(l_jumped_to_by_3, l_hl_index_4);
                            assert(v2140);
                            table.remove(l_jumped_to_by_3, v2140);
                        elseif v2133[l_index_1] then
                            l_jump_3.type = "continue";
                            local l_jump_5 = v2131.jump;
                            assert(l_jump_5);
                            local v2142 = v1364[l_jump_5.destination];
                            assert(v2142);
                            local l_hl_index_5 = v2131.hl_index;
                            local l_jumped_to_by_4 = v1869[v2142.index].jumped_to_by;
                            local v2145 = table.find(l_jumped_to_by_4, l_hl_index_5);
                            assert(v2145);
                            table.remove(l_jumped_to_by_4, v2145);
                        end;
                    end;
                    local l_type_3 = v2131.type;
                    if l_type_3 == "sequential" then
                        for _, v2148 in ipairs(v2131.data) do
                            v2130(v1364[v2148], v2132, v2133);
                        end;
                        return;
                    else
                        if not (l_type_3 ~= "ifthen") or l_type_3 == "ifthenelse" then
                            local l_data_0 = v2131.data;
                            v2130(v1364[l_data_0.pass], v2132, v2133);
                            local l_else__1 = l_data_0.else_;
                            if l_else__1 then
                                v2130(v1364[l_else__1], v2132, v2133);
                            end;
                        end;
                        return;
                    end;
                end;
                local v2151 = nil;
                local l_v1898_1 = v1898 --[[ copy: 107 -> 190 ]];
                local l_v1900_1 = v1900 --[[ copy: 109 -> 191 ]];
                local l_v1910_1 = v1910 --[[ copy: 112 -> 192 ]];
                local l_v2046_1 = v2046 --[[ copy: 136 -> 193 ]];
                local l_v1918_1 = v1918 --[[ copy: 113 -> 194 ]];
                local l_v2039_1 = v2039 --[[ copy: 135 -> 195 ]];
                do
                    local l_v2151_0 = v2151;
                    local function v2170()
                        local v2159 = false;
                        while true do
                            local v2160 = 0;
                            for v2161 = #l_v1898_1, 1, -1 do
                                local v2162 = v1364[v2161];
                                if #v2162.children == 1 then
                                    local v2163 = v1364[v2162.children[1]];
                                    if v2163 ~= v2162 and not (table.find(v2163.children, v2163.hl_index) and true or false) and #v2163.parents <= 1 and #v2163.jumped_to_by <= 0 and v2163.index >= v2162.index then
                                        local v2164 = if v2162.type == "sequential" then v1364[v2162.data[#v2162.data]] else v2162;
                                        if l_v1900_1[v2164] then
                                            local l_data_1 = v2164.data;
                                            local v2166 = v1364[l_data_1.pass];
                                            if v2166 then
                                                local l_jump_6 = v2166.jump;
                                                assert(l_jump_6);
                                                if not (not (l_jump_6.type == "goto") or v2166.index == 0) then
                                                    continue;
                                                end;
                                            end;
                                            if l_data_1.else_ and v1364[l_data_1.else_] then
                                                error("IDK");
                                            end;
                                        end;
                                        if table.find(v2162.children, v2163.hl_index) and true or false then
                                            if not (v2163.index == v2162.index + v2162.length) or v2163.index == 0 then
                                                v2164 = true;
                                                v2159 = true;
                                            else
                                                local l__visitor_6 = v2162._visitor;
                                                if l__visitor_6 and l__visitor_6.condition then
                                                    v2164 = true;
                                                    v2159 = true;
                                                end;
                                            end;
                                        end;
                                        if not v2159 then
                                            if not v2159 then
                                                v2164 = nil;
                                            end;
                                        end;
                                        v2159 = false;
                                        if v2164 then

                                        end;
                                        assert(table.find(v2163.parents, v2162.hl_index));
                                        if v2162.type == "sequential" then
                                            if not v2162._visitor or not v2162._visitor.condition then
                                                l_v2151_0 = l_v2151_0 + 1;
                                                v2160 = v2160 + 1;
                                                table.insert(v2162.data, v2163.hl_index);
                                                v2162.length = v2162.length + v2163.length;
                                                l_v1910_1(v2162, v2163);
                                                l_v1979_1(v2162, v2163);
                                                l_v2046_1(v2163, v2162);
                                                v2162._visitor = v2163._visitor;
                                            else
                                                continue;
                                            end;
                                        elseif not v2162._visitor or not v2162._visitor.condition then
                                            l_v2151_0 = l_v2151_0 + 1;
                                            v2160 = v2160 + 1;
                                            v2164 = #v1364 + 1;
                                            local v2169 = {
                                                code_index = v1361[v2162.index], 
                                                index = v2162.index, 
                                                actual_code_index = v1827[v1361[v2162.index]], 
                                                actual_index = v1828[v2162.index], 
                                                hl_index = v2164, 
                                                length = v2162.length + v2163.length, 
                                                type = "sequential", 
                                                data = {
                                                    v2162.hl_index, 
                                                    v2163.hl_index
                                                }, 
                                                parents = {}, 
                                                children = {}, 
                                                jumped_to_by = {}, 
                                                _visitor = v2163._visitor
                                            };
                                            l_v1918_1(v2169, {
                                                v2162, 
                                                v2163
                                            });
                                            l_v2039_1(v2162, v2169);
                                            l_v1979_1(v2162, v2163);
                                            l_v2046_1(v2163, v2169);
                                        else
                                            continue;
                                        end;
                                        l_v1901_1();
                                    end;
                                end;
                            end;
                            if not (v2160 ~= 0) then
                                break;
                            end;
                        end;
                    end;
                    while true do
                        l_v2151_0 = 0;
                        v1901();
                        for v2171 = #v1898, 1, -1 do
                            local v2172 = v1364[v2171];
                            if not (#v2172.children ~= 1) or #v2172.children == 2 then
                                local v2173 = false;
                                local l__visitor_7 = v2172._visitor;
                                if l__visitor_7 and l__visitor_7.condition then
                                    assert(v1971(v2172, v1364[v2172.children[1]]));
                                    local v2175 = v2172.children[1];
                                    assert(v2175);
                                    if #v1364[v2175].children <= 1 then
                                        local v2176 = v2172.children[2];
                                        local v2177 = nil;
                                        local v2178 = nil;
                                        local v2179 = nil;
                                        if v2176 then
                                            assert(v2176);
                                            assert(v2175 ~= v2176);
                                            if #v1364[v2176].children <= 1 then
                                                local l_children_1 = v1364[v2175].children;
                                                if #l_children_1 <= 1 then
                                                    local _ = l_children_1[1];
                                                    local v2182 = v1364[v2176].children[1];
                                                    local v2183 = v2182 and v1971(v1364[v2176], v1364[v2182]);
                                                    if v2183 then
                                                        if v2129 then
                                                            v2179 = v1364[v2182];
                                                        else
                                                            continue;
                                                        end;
                                                    end;
                                                    v2177 = v1364[v2175];
                                                    v2178 = v1364[v2176];
                                                    if v2177 ~= v2172 then
                                                        if v2183 then
                                                            if not (#v2177.parents >= 1) then
                                                                continue;
                                                            end;
                                                        elseif not (#v2177.parents >= 2) then
                                                            continue;
                                                        end;
                                                        if not v2178 or not v2177 then
                                                            error("Shouldn't happen...");
                                                        end;
                                                        if v2183 or v1967(v2178, v2177) then
                                                            local v2184 = v1897[v2178.index + v2178.length];
                                                            if v2183 and v2184 and v2184 == v2177 then
                                                                assert(v2179);
                                                                if v2179.index <= v2177.index and not v2019(v2177, v2178, {}, true) then
                                                                    v2179 = v1364[v2177.hl_index];
                                                                    local l_v2177_0 = v2177;
                                                                    v2177 = v2178;
                                                                    local l_v2178_0 = v2178;
                                                                    v2178 = v1931();
                                                                    v1998(v2172, l_v2178_0, v2178);
                                                                    v1998(v2172, l_v2177_0, v2177);
                                                                    assert(v2179);
                                                                    v1974(v2178, v2179);
                                                                end;
                                                            end;
                                                        else
                                                            continue;
                                                        end;
                                                    else
                                                        continue;
                                                    end;
                                                else
                                                    continue;
                                                end;
                                            else
                                                continue;
                                            end;
                                        else
                                            v2177 = v1364[v2175];
                                            v2178 = v1931();
                                            v1974(v2178, v2177);
                                            v2173 = true;
                                        end;
                                        local v2187, v2188, v2189, v2190 = v2091(if v2173 then v2177 else v2178, v2177, v2178.index == 0);
                                        local v2191 = {
                                            code_index = v2188.code_index, 
                                            index = v2188.index, 
                                            actual_code_index = v2188.actual_code_index, 
                                            actual_index = v2188.actual_index, 
                                            hl_index = #v1364 + 1, 
                                            length = v2190 + v2178.length, 
                                            type = "ifthen", 
                                            data = {
                                                pass = v2178.hl_index, 
                                                condition = v2187, 
                                                condition_length = v2190
                                            }, 
                                            parents = {}, 
                                            children = {}, 
                                            jumped_to_by = {}
                                        };
                                        local v2192 = {
                                            v2178
                                        };
                                        for v2193 in pairs(v2189) do
                                            table.insert(v2192, v2193);
                                        end;
                                        v1918(v2191, v2192);
                                        if v2179 then
                                            v1979(v2178, v2179);
                                            v1935(v2178, v2179.hl_index);
                                        else
                                            v1979(v2178, v2177);
                                        end;
                                        v2039(v2188, v2191);
                                        v1974(v2191, v2177);
                                        if v1967(v2178, v2177) then
                                            v1979(v2172, v2178);
                                        end;
                                        v1906(v2191);
                                        v1901();
                                    end;
                                end;
                            end;
                        end;
                        for v2194 in pairs(table.clone(v1900)) do
                            if #v2194.children == 1 then
                                v1901();
                                local v2195 = v1364[v2194.children[1]];
                                if v2195 and #v2195.children == 1 then
                                    local l_data_2 = v2194.data;
                                    local v2197 = v1364[l_data_2.pass];
                                    assert(v2197.jump);
                                    local v2198 = v1364[v2197.jump.destination];
                                    assert(v2198);
                                    local v2199 = v1364[v2195.children[1]];
                                    if v2198.hl_index == v2199.hl_index then
                                        l_v2151_0 = l_v2151_0 + 1;
                                        v1901();
                                        l_data_2.else_ = v2195.hl_index;
                                        v2194.type = "ifthenelse";
                                        v2194.length = v2194.length + v2195.length;
                                        v1949(v2197);
                                        v1900[v2194] = nil;
                                        v1974(v2194, v2198);
                                        v1979(v2194, v2195);
                                        v1979(v2195, v2198);
                                        v1906(v2194);
                                        v1901();
                                    end;
                                end;
                            end;
                        end;
                        while true do
                            local v2200 = 0;
                            for v2201 = #v1898, 1, -1 do
                                local v2202 = v1364[v2201];
                                if #v2202.children == 1 then
                                    local l__visitor_8 = v2202._visitor;
                                    if (not l__visitor_8 or not l__visitor_8.condition) and v2202.children[1] == v2202.hl_index and l__visitor_8 then
                                        assert(l__visitor_8);
                                        l_v2151_0 = l_v2151_0 + 1;
                                        v2200 = v2200 + 1;
                                        local v2204 = {
                                            code_index = v2202.code_index, 
                                            index = v2202.index, 
                                            actual_code_index = v2202.actual_code_index, 
                                            actual_index = v2202.actual_index, 
                                            hl_index = #v1364 + 1, 
                                            length = v2202.length, 
                                            type = "oneblockwhile", 
                                            data = {
                                                code = v2202.hl_index, 
                                                for_info = l__visitor_8.for_info
                                            }, 
                                            parents = {}, 
                                            children = {}, 
                                            jumped_to_by = {}, 
                                            _visitor = v2202._visitor
                                        };
                                        v1918(v2204, {
                                            v2202
                                        });
                                        v2051(v2202, v2204);
                                        v1979(v2204, v2204);
                                        local v2205 = v1897[v2204.index + v2204.length];
                                        local v2206 = {};
                                        if v2205 then
                                            v1974(v2204, v2205);
                                            v2206[v2205.index] = true;
                                        end;
                                        v2130(v2202, v2206, {
                                            [v2204.index] = true, 
                                            [v2204.index + v2204.length - 1] = true
                                        });
                                    end;
                                end;
                            end;
                            if not (v2200 ~= 0) then
                                break;
                            end;
                        end;
                        v2170();
                        if not (l_v2151_0 == 0) then
                            v2129 = false;
                            continue;
                        end;
                        if not v2129 then
                            v2129 = true;
                        else
                            break;
                        end;
                    end;
                    v1348:end_benchmark("Control Flow Analysis");
                    v1348:start_benchmark("Control Flow Recovery");
                    l_v2151_0 = 0;
                    while true do
                        l_v2151_0 = 0;
                        for _, v2208 in ipairs(v1898) do
                            if #v2208.parents > 0 then
                                local v2209 = table.clone(v2208.parents);
                                table.insert(v2209, v2208.hl_index);
                                local _ = v2208.index;
                                local l_length_0 = v2208.length;
                                local l_index_3 = v2208.index;
                                for _, v2214 in ipairs(v2208.parents) do
                                    local v2215 = v1364[v2214];
                                    if #v2215.parents <= 0 and #v2215.children == 1 then
                                        assert(v2215.children[1] == v2208.hl_index);
                                        l_length_0 = l_length_0 + v2215.length;
                                        if v2215.index < l_index_3 and v2215.index > 0 then
                                            l_index_3 = v2215.index;
                                        end;
                                        v2215.analysis_failed = true;
                                    else
                                        break;
                                    end;
                                end;
                                for _, v2217 in ipairs(table.clone(v2208.parents)) do
                                    v1979(v1364[v2217], v2208);
                                end;
                                v1918({
                                    code_index = v1361[l_index_3], 
                                    index = l_index_3, 
                                    actual_code_index = v1827[v1361[l_index_3]], 
                                    actual_index = v1828[l_index_3], 
                                    hl_index = #v1364 + 1, 
                                    length = l_length_0, 
                                    type = "sequential", 
                                    data = v2209, 
                                    parents = {}, 
                                    children = v2208.children, 
                                    jumped_to_by = {}
                                });
                                v2208.analysis_failed = true;
                                v1988(v2208);
                                l_v2151_0 = l_v2151_0 + 1;
                                v1871 = true;
                            end;
                        end;
                        if not (l_v2151_0 ~= 0) then
                            break;
                        end;
                    end;
                    v1901();
                end;
                v1348:end_benchmark("Control Flow Recovery");
                v1348:start_benchmark("Stack Incantation");
                v1872 = function()
                    for v2218 = #v1364, 1, -1 do
                        local v2219 = v1364[v2218];
                        if v2219.index == 1 then
                            if #v1364 > 1 then

                            end;
                            return v2219;
                        end;
                    end;
                    error("Critical control flow failure: Failed to find entry point");
                end;
                v1873 = function(v2220, v2221)
                    assert(v2221 < v2220.depth);
                    local l_v2220_0 = v2220;
                    while l_v2220_0.depth ~= v2221 do
                        l_v2220_0 = l_v2220_0.parent;
                        assert(l_v2220_0);
                    end;
                    return l_v2220_0;
                end;
                v1874 = function(v2223, v2224)
                    if v2223.depth < v2224.depth then
                        return false;
                    else
                        local l_v2223_0 = v2223;
                        while true do
                            if l_v2223_0.depth ~= v2224.depth then
                                l_v2223_0 = l_v2223_0.parent;
                                if not l_v2223_0 then
                                    return false;
                                end;
                            else
                                return l_v2223_0.hl_index == v2224.hl_index;
                            end;
                        end;
                    end;
                end;
                v1880 = {};
                v1881 = {};
                v1882 = {};
                v1897 = function(v2226, v2227)
                    local v2228 = nil;
                    local l_depth_0 = v2226.depth;
                    local l_depth_1 = v2227.depth;
                    if l_depth_0 == l_depth_1 then
                        v2228 = l_depth_0;
                    elseif l_depth_0 < l_depth_1 then
                        v2228 = l_depth_0;
                        local l_v2227_0 = v2227;
                        local l_v2228_0 = v2228;
                        assert(l_v2228_0 < l_v2227_0.depth);
                        local l_l_v2227_0_0 = l_v2227_0;
                        while l_l_v2227_0_0.depth ~= l_v2228_0 do
                            l_l_v2227_0_0 = l_l_v2227_0_0.parent;
                            assert(l_l_v2227_0_0);
                        end;
                        v2227 = l_l_v2227_0_0;
                    else
                        v2228 = l_depth_1;
                        local l_v2226_0 = v2226;
                        local l_v2228_1 = v2228;
                        assert(l_v2228_1 < l_v2226_0.depth);
                        local l_l_v2226_0_0 = l_v2226_0;
                        while l_l_v2226_0_0.depth ~= l_v2228_1 do
                            l_l_v2226_0_0 = l_l_v2226_0_0.parent;
                            assert(l_l_v2226_0_0);
                        end;
                        v2226 = l_l_v2226_0_0;
                    end;
                    assert(v2226.depth == v2227.depth);
                    while v2226.hl_index ~= v2227.hl_index do
                        v2226 = v2226.parent;
                        assert(v2226);
                        v2227 = v2227.parent;
                        assert(v2227);
                    end;
                    return v2226;
                end;
                v1898 = {};
                v1899 = {};
                v1900 = 0;
                v1901 = {};
                v1906 = function(v2237, v2238, v2239)
                    local l_reg_reads_global_0 = v2237.reg_reads_global;
                    local l_reg_writes_global_0 = v2237.reg_writes_global;
                    local v2242 = nil;
                    local v2243 = nil;
                    local v2244 = l_reg_reads_global_0[v2238];
                    local v2245;
                    if v2244 then
                        v2245 = v2244;
                    else
                        local v2246 = {};
                        l_reg_reads_global_0[v2238] = v2246;
                        v2245 = v2246;
                    end;
                    if #v2245 > 0 then
                        for v2247 = #v2245, 1, -1 do
                            local v2248 = v2245[v2247];
                            if v2248.location.depth <= v2239 then
                                v2242 = v2248;
                                break;
                            end;
                        end;
                    end;
                    local v2249 = l_reg_writes_global_0[v2238];
                    if v2249 then
                        v2244 = v2249;
                    else
                        local v2250 = {};
                        l_reg_writes_global_0[v2238] = v2250;
                        v2244 = v2250;
                    end;
                    if #v2244 > 0 then
                        for v2251 = #v2244, 1, -1 do
                            local v2252 = v2244[v2251];
                            if v2252.location.depth <= v2239 then
                                return v2242, v2252;
                            end;
                        end;
                    end;
                    return v2242, v2243;
                end;
                v1910 = function(v2253, v2254, _)
                    local v2256, v2257 = v1906(v2253, v2254, v1350);
                    local v2258 = if v2256 then v2256.code.index else -1;
                    if v2257 then
                        return v2258, v2257.code.index;
                    else
                        return v2258, -1;
                    end;
                end;
                v1918 = function(v2259)
                    return v2259.index + v2259.length;
                end;
                v1924 = function(v2260)
                    if v2260._visitor then
                        return v2260.index + v2260.length - 2;
                    else
                        return v2260.index + v2260.length - 1;
                    end;
                end;
                v1931 = function(v2261, v2262, v2263)
                    local v2264 = {
                        hl_index = v2261.location.hl_index, 
                        start_code = v2262, 
                        register = v2263
                    };
                    if v2261.neglected[v2263] then

                    end;
                    local l_neglected_0 = v2261.neglected;
                    local v2266 = l_neglected_0[v2263];
                    local v2267;
                    if v2266 then
                        v2267 = v2266;
                    else
                        local v2268 = {};
                        l_neglected_0[v2263] = v2268;
                        v2267 = v2268;
                    end;
                    table.insert(v2267, v2264);
                end;
                v1935 = function(v2269, _, v2271)
                    local v2272 = v2269.neglected[v2271];
                    if v2272 then
                        for _ = #v2272, 1, -1 do

                        end;
                    end;
                end;
                v1942 = function(v2274, v2275)
                    local l_type_4 = v2274.type;
                    if l_type_4 == "single" then
                        local v2277 = v1898[v2274.hl_index];
                        assert(v2277);
                        local l_reg_writes_0 = v2277.reg_writes;
                        for v2279 = v2275.beginning, v2275.ending do
                            if l_reg_writes_0[v2279] then
                                return true;
                            end;
                        end;
                        return false;
                    elseif l_type_4 == "sequential" then
                        for _, v2281 in ipairs(v2274.data) do
                            if v1942(v1364[v2281], v2275) then
                                return true;
                            end;
                        end;
                        return false;
                    elseif l_type_4 == "ifthen" then
                        assert(not v2274.data.else_);
                        return false;
                    elseif l_type_4 == "ifthenelse" then
                        local l_data_3 = v2274.data;
                        local l_else__2 = l_data_3.else_;
                        assert(l_else__2);
                        return v1942(v1364[l_data_3.pass], v2275) and v1942(v1364[l_else__2], v2275);
                    elseif l_type_4 == "oneblockwhile" then
                        local l_data_4 = v2274.data;
                        return v1942(v1364[l_data_4.code], v2275);
                    else
                        error((("Unknown hl_block type %*"):format(l_type_4)));
                        return;
                    end;
                end;
                v1949 = function(v2285, v2286, v2287, v2288)
                    local v2289 = nil;
                    local v2290 = nil;
                    local v2291 = nil;
                    local v2292 = nil;
                    if v2287 then
                        assert(v2288);
                        v2292 = v2287;
                    else
                        assert(not v2288);
                        local _, v2294 = v1906(v2285, v2286.register_range.beginning, v2285.location.depth);
                        v2292 = v2294;
                    end;
                    local v2295 = not v2292;
                    if not v2295 then
                        assert(v2292);
                        if v2292.code.opname == "NAMECALL" then
                            v2295 = true;
                        else
                            local l_location_0 = v2292.location;
                            local l_location_1 = v2286.location;
                            if l_location_1.depth <= l_location_0.depth then
                                v2295 = true;
                            else
                                while l_location_1.depth ~= l_location_0.depth + 1 do
                                    l_location_1 = l_location_1.parent;
                                    assert(l_location_1);
                                end;
                                assert(l_location_1.parent);
                                if v1364[(if v2288 then l_location_1.parent.parent else l_location_1.parent).hl_index].index ~= v1364[l_location_0.hl_index].index then
                                    v2295 = true;
                                else
                                    local v2298 = v1880[l_location_1.hl_index];
                                    if v2298 then
                                        local _ = v2298;
                                    end;
                                    v2291 = v2292.location;
                                    v2290 = v2292.code.index;
                                end;
                            end;
                        end;
                    end;
                    if v2295 then
                        local l_location_2 = v2285.location;
                        local l_location_3 = v2286.location;
                        v2291 = v1897(l_location_2, l_location_3);
                        local v2302 = v1869[v1364[v2291.hl_index].index];
                        v2290 = if v2302._visitor then v2302.index + v2302.length - 2 else v2302.index + v2302.length - 1;
                        v2289 = true;
                    end;
                    assert(v2290);
                    table.insert(v2285.observations, {
                        type = "scoped variable", 
                        info = {
                            wanted_definition_point = v2290, 
                            definition_location = v2291, 
                            is_predefinition = v2289, 
                            register_range = v2286.register_range
                        }, 
                        location = v2285.location
                    });
                end;
                v1957 = function(v2303, v2304, v2305, v2306, v2307, v2308)
                    local v2309 = {
                        type = "define variable", 
                        info = {
                            register_range = v2304, 
                            definition_location = v2306, 
                            is_predefinition = v2307, 
                            no_definition = v2308, 
                            start_of_use = v2305
                        }
                    };
                    local v2310 = v2303[v2305];
                    if v2310 then
                        local v2311 = false;
                        for _, v2313 in ipairs(v2310) do
                            local l_beginning_4 = v2304.beginning;
                            local l_register_range_0 = v2313.info.register_range;
                            local l_beginning_5 = l_register_range_0.beginning;
                            local l_ending_3 = l_register_range_0.ending;
                            local v2318 = false;
                            if l_beginning_5 <= l_beginning_4 then
                                v2318 = l_beginning_4 <= l_ending_3;
                            end;
                            if v2318 then
                                assert(not v2311);
                                v2313.info.definition_location = v2306;
                                v2311 = true;
                                error("messasdasdasdasdasdasdasdasdasdasdage");
                            end;
                        end;
                        if not v2311 then
                            table.insert(v2310, v2309);
                            return;
                        end;
                    else
                        v2303[v2305] = {
                            v2309
                        };
                    end;
                end;
                v1962 = function(v2319, v2320, v2321, v2322)
                    local v2323 = {
                        hl_index = v2319, 
                        depth = if v2321 then v2320.depth + 1 else v2320.depth, 
                        parent = if v2321 then v2320 else v2320.parent, 
                        last_loop = v2320.last_loop
                    };
                    if v2322 then
                        v2323.last_loop = v2323;
                    end;
                    return v2323;
                end;
                v1964 = function(v2324, v2325, v2326, v2327, v2328, v2329)
                    v1900 = v1900 + 1;
                    v2324.preprocess_task_index = v1900;
                    v1901[v1900] = v2325;
                    local v2330 = {
                        type = v2326, 
                        var_reg_range = v2327, 
                        predef = v2328, 
                        no_inline = v2329
                    };
                    local v2331 = v1357[v2325];
                    if v2331 then
                        for _, v2333 in ipairs(v2331) do
                            if v2333.type == v2326 then
                                local l_beginning_6 = v2327.beginning;
                                local l_var_reg_range_4 = v2333.var_reg_range;
                                local l_beginning_7 = l_var_reg_range_4.beginning;
                                local l_ending_4 = l_var_reg_range_4.ending;
                                local v2338 = false;
                                if l_beginning_7 <= l_beginning_6 then
                                    v2338 = l_beginning_6 <= l_ending_4;
                                end;
                                if v2338 then
                                    return v2333;
                                end;
                            end;
                        end;
                        table.insert(v2331, v2330);
                        return v2330;
                    else
                        v1357[v2325] = {
                            v2330
                        };
                        return v2330;
                    end;
                end;
                v1967 = function(v2339, v2340, v2341)
                    v1964(v2339, v2341, "lockvar", v2340);
                end;
                v1971 = function(v2342, v2343, v2344)
                    v1964(v2342, v2344, "unlockvar", v2343);
                end;
                v1974 = function(v2345, v2346, v2347, _)
                    local l_register_range_1 = v2346.register_range;
                    for v2350 = l_register_range_1.beginning, l_register_range_1.ending do
                        local v2351 = v2345.reg_forced_var[v2350];
                        if v2351 then
                            table.insert(v2351, v2346);
                        else
                            v2345.reg_forced_var[v2350] = {
                                v2346
                            };
                        end;
                        v2345.reg_has_var[v2350] = l_register_range_1;
                    end;
                    v1964(v2345, v2347, "lockvar", l_register_range_1);
                end;
                v1979 = function(v2352, v2353, v2354)
                    local v2355 = v2352.reg_forced_var[v2353];
                    if v2355 then
                        for v2356 = #v2355, 1, -1 do
                            local v2357 = v2355[v2356];
                            local l_register_range_2 = v2357.register_range;
                            local l_beginning_8 = l_register_range_2.beginning;
                            local l_ending_5 = l_register_range_2.ending;
                            local v2361 = false;
                            if l_beginning_8 <= v2353 then
                                v2361 = v2353 <= l_ending_5;
                            end;
                            if v2361 then
                                if not (v2352.location.depth <= v2357.definition_location.depth) or v2352.location.hl_index == v2357.definition_location.hl_index then
                                    return v2357;
                                else
                                    v2361 = v2357.register_range;
                                    v1964(v2352, v2354, "unlockvar", v2361);
                                    v2355[v2356] = nil;
                                end;
                            end;
                        end;
                        if #v2355 == 0 then
                            v2352.reg_forced_var[v2353] = nil;
                        end;
                    end;
                    return nil;
                end;
                v1984 = function(v2362, v2363, v2364, v2365, v2366)
                    if v2365 then
                        assert(v2364);
                        v1964(v2362, v2364, "defvar", v2363, true, v2366);
                    elseif v2364 then
                        v1964(v2362, v2364, "defvar", v2363, nil, v2366);
                    else
                        local v2367 = v2362.reg_writes_global[v2363.beginning];
                        local v2368 = v2367[#v2367];
                        v1964(v2362, v2368.code.code_index, "defvar", v2363, nil, v2366);
                    end;
                    for v2369 = v2363.beginning, v2363.ending do
                        v2362.reg_has_var[v2369] = v2363;
                    end;
                end;
                v1988 = function(v2370, v2371)
                    local v2372 = v2370.reg_has_var[v2371];
                    for v2373 = v2372.beginning, v2372.ending do
                        v2370.reg_has_var[v2373] = nil;
                    end;
                end;
                v1992 = function(v2374, v2375, v2376)
                    local l_reg_reads_0 = v2374.reg_reads;
                    local v2378 = l_reg_reads_0[v2375];
                    local v2379;
                    if v2378 then
                        v2379 = v2378;
                    else
                        local v2380 = {};
                        l_reg_reads_0[v2375] = v2380;
                        v2379 = v2380;
                    end;
                    table.insert(v2379, v2376);
                    l_reg_reads_0 = v2374.reg_reads_global;
                    v2378 = l_reg_reads_0[v2375];
                    if v2378 then
                        v2379 = v2378;
                    else
                        local v2381 = {};
                        l_reg_reads_0[v2375] = v2381;
                        v2379 = v2381;
                    end;
                    table.insert(v2379, v2376);
                    local _ = v2376.code;
                    v2379 = v2374.neglected[v2375];
                    if v2379 then
                        for _ = #v2379, 1, -1 do

                        end;
                    end;
                end;
                v1998 = function(v2384, v2385, v2386)
                    local l_reg_writes_1 = v2384.reg_writes;
                    local v2388 = l_reg_writes_1[v2385];
                    local v2389;
                    if v2388 then
                        v2389 = v2388;
                    else
                        local v2390 = {};
                        l_reg_writes_1[v2385] = v2390;
                        v2389 = v2390;
                    end;
                    table.insert(v2389, v2386);
                    l_reg_writes_1 = v2384.reg_writes_global;
                    v2388 = l_reg_writes_1[v2385];
                    if v2388 then
                        v2389 = v2388;
                    else
                        local v2391 = {};
                        l_reg_writes_1[v2385] = v2391;
                        v2389 = v2391;
                    end;
                    table.insert(v2389, v2386);
                    v2389 = {
                        hl_index = v2384.location.hl_index, 
                        start_code = v2386.code, 
                        register = v2385
                    };
                    if v2384.neglected[v2385] then

                    end;
                    local l_neglected_1 = v2384.neglected;
                    local v2393 = l_neglected_1[v2385];
                    if v2393 then
                        v2388 = v2393;
                    else
                        local v2394 = {};
                        l_neglected_1[v2385] = v2394;
                        v2388 = v2394;
                    end;
                    table.insert(v2388, v2389);
                end;
                v2004 = {};
                v2012 = function(v2395, v2396, v2397, v2398)
                    local l_reg_has_var_0 = v2395.reg_has_var;
                    if v2398 and not v2004[v2397] then
                        table.insert(v2397, v2398.code);
                        v2004[v2397] = true;
                    end;
                    local v2400 = {};
                    for _, v2402 in ipairs(v2397) do
                        v1899[v2402.index] = v2396;
                        local v2403 = {};
                        local v2404 = v2395.demands[v2402.index];
                        if v2404 then
                            for v2405 = #v2404, 1, -1 do
                                local v2406 = v2404[v2405];
                                if v2406.type == "define variable" then
                                    local l_register_range_3 = v2406.info.register_range;
                                    for v2408 = l_register_range_3.beginning, l_register_range_3.ending do
                                        local v2409 = v2395.reg_forced_var[v2408];
                                        local v2410 = {
                                            register_range = l_register_range_3, 
                                            beginning = v2402.index, 
                                            definition_location = v2406.info.definition_location, 
                                            start_of_use = v2406.info.start_of_use
                                        };
                                        if v2409 then
                                            table.insert(v2409, v2410);
                                        elseif v2406.info.is_predefinition then
                                            assert(not v2406.info.no_definition);
                                            v1984(v2395, l_register_range_3, v2402.code_index, true, true);
                                            v1974(v2395, v2410, v2402.code_index);
                                        elseif v2406.info.no_definition then
                                            v1974(v2395, v2410, v2402.code_index);
                                        else
                                            table.insert(v2403, v2410);
                                        end;
                                    end;
                                else
                                    error((("Unknown demand %*"):format(v2406.type)));
                                end;
                            end;
                            v2395.demands[v2402.index] = nil;
                        end;
                        local v2411, v2412, _ = v301(v2402);
                        local v2414 = {};
                        local v2415 = {};
                        for _, v2417 in ipairs(v2411) do
                            v2415[v2417] = true;
                            local v2418 = v1979(v2395, v2417, v2402.code_index);
                            if v2418 then
                                v2414[v2417] = v2418;
                                l_reg_has_var_0[v2417] = v2418.register_range;
                            end;
                        end;
                        for _, v2420 in ipairs(v2412) do
                            if not v2415[v2420] then
                                local v2421 = v1979(v2395, v2420, v2402.code_index);
                                if v2421 then
                                    v2414[v2420] = v2421;
                                    l_reg_has_var_0[v2420] = v2421.register_range;
                                end;
                            end;
                        end;
                        for v2422 in pairs(v2400) do
                            if not v2414[v2422] then

                            end;
                        end;
                        v2400 = table.clone(v2414);
                        v2415 = nil;
                        if #v2412 > 1 then
                            local v2423 = true;
                            local v2424 = v2412[1];
                            for v2425 = 2, #v2412 do
                                v2424 = v2424 + 1;
                                if v2412[v2425] ~= v2424 then
                                    v2423 = nil;
                                    break;
                                end;
                            end;
                            if v2423 then
                                local v2426 = v2412[1];
                                local v2427 = v2412[#v2412];
                                v2415 = if v2427 then {
                                    beginning = v2426, 
                                    ending = v2427
                                } else {
                                    beginning = v2426, 
                                    ending = v2426
                                };
                            end;
                        elseif #v2412 == 1 then
                            local v2428 = v2412[1];
                            v2415 = {
                                beginning = v2428, 
                                ending = v2428
                            };
                        end;
                        if #v2411 == 0 then
                            for _, v2430 in ipairs(v2412) do
                                if l_reg_has_var_0[v2430] and not v2414[v2430] then
                                    local v2431 = v2395.reg_has_var[v2430];
                                    for v2432 = v2431.beginning, v2431.ending do
                                        v2395.reg_has_var[v2432] = nil;
                                    end;
                                end;
                                v2395.uncertain_regs[v2430] = nil;
                                local v2433 = {
                                    code = v2402, 
                                    location = v2395.location, 
                                    reg_range = v2415
                                };
                                local l_reg_writes_2 = v2395.reg_writes;
                                local v2435 = l_reg_writes_2[v2430];
                                local v2436;
                                if v2435 then
                                    v2436 = v2435;
                                else
                                    local v2437 = {};
                                    l_reg_writes_2[v2430] = v2437;
                                    v2436 = v2437;
                                end;
                                table.insert(v2436, v2433);
                                l_reg_writes_2 = v2395.reg_writes_global;
                                v2435 = l_reg_writes_2[v2430];
                                if v2435 then
                                    v2436 = v2435;
                                else
                                    local v2438 = {};
                                    l_reg_writes_2[v2430] = v2438;
                                    v2436 = v2438;
                                end;
                                table.insert(v2436, v2433);
                                v2436 = {
                                    hl_index = v2395.location.hl_index, 
                                    start_code = v2433.code, 
                                    register = v2430
                                };
                                if v2395.neglected[v2430] then

                                end;
                                local l_neglected_2 = v2395.neglected;
                                local v2440 = l_neglected_2[v2430];
                                if v2440 then
                                    v2435 = v2440;
                                else
                                    local v2441 = {};
                                    l_neglected_2[v2430] = v2441;
                                    v2435 = v2441;
                                end;
                                table.insert(v2435, v2436);
                            end;
                        else
                            for _, v2443 in ipairs(v2411) do
                                if not v2414[v2443] then
                                    local v2444 = v2395.uncertain_regs[v2443];
                                    if v2444 then
                                        local l_location_4 = v2395.location;
                                        local l_location_5 = v2444.location;
                                        local v2447;
                                        if l_location_4.depth < l_location_5.depth then
                                            v2447 = false;
                                        else
                                            local l_l_location_4_0 = l_location_4;
                                            while true do
                                                if l_l_location_4_0.depth ~= l_location_5.depth then
                                                    l_l_location_4_0 = l_l_location_4_0.parent;
                                                    if not l_l_location_4_0 then
                                                        v2447 = false;
                                                        break;
                                                    end;
                                                else
                                                    v2447 = l_l_location_4_0.hl_index == l_location_5.hl_index;
                                                    break;
                                                end;
                                            end;
                                        end;
                                        if not v2447 then
                                            v1949(v2395, v2444);
                                        end;
                                    else
                                        local v2449 = v2395.reg_writes_global[v2443];
                                        if v2449 and #v2449 > 0 then
                                            local v2450 = v2449[#v2449];
                                            local l_last_loop_0 = v2395.location.last_loop;
                                            if l_last_loop_0 then
                                                local l_location_6 = v2395.location;
                                                local v2453;
                                                if l_location_6.depth < l_last_loop_0.depth then
                                                    v2453 = false;
                                                else
                                                    local l_l_location_6_0 = l_location_6;
                                                    while true do
                                                        if l_l_location_6_0.depth ~= l_last_loop_0.depth then
                                                            l_l_location_6_0 = l_l_location_6_0.parent;
                                                            if not l_l_location_6_0 then
                                                                v2453 = false;
                                                                break;
                                                            end;
                                                        else
                                                            v2453 = l_l_location_6_0.hl_index == l_last_loop_0.hl_index;
                                                            break;
                                                        end;
                                                    end;
                                                end;
                                                if v2453 then
                                                    local l_location_7 = v2450.location;
                                                    if l_location_7.depth < l_last_loop_0.depth then
                                                        v2453 = false;
                                                    else
                                                        local l_l_location_7_0 = l_location_7;
                                                        while true do
                                                            if l_l_location_7_0.depth ~= l_last_loop_0.depth then
                                                                l_l_location_7_0 = l_l_location_7_0.parent;
                                                                if not l_l_location_7_0 then
                                                                    v2453 = false;
                                                                    break;
                                                                end;
                                                            else
                                                                v2453 = l_l_location_7_0.hl_index == l_last_loop_0.hl_index;
                                                                break;
                                                            end;
                                                        end;
                                                    end;
                                                    if not v2453 then
                                                        v2453 = {
                                                            index = v2402.index, 
                                                            location = l_location_6, 
                                                            register_range = {
                                                                beginning = v2443, 
                                                                ending = v2443
                                                            }
                                                        };
                                                        v1949(v2395, v2453, v2450, true);
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                if not l_reg_has_var_0[v2443] and not v2414[v2443] then
                                    local l_reg_reads_global_1 = v2395.reg_reads_global;
                                    local v2458 = l_reg_reads_global_1[v2443];
                                    local v2459;
                                    if v2458 then
                                        v2459 = v2458;
                                    else
                                        local v2460 = {};
                                        l_reg_reads_global_1[v2443] = v2460;
                                        v2459 = v2460;
                                    end;
                                    if #v2459 > 0 then
                                        v2458 = v2395.reg_writes_global;
                                        local v2461 = v2458[v2443];
                                        if v2461 then
                                            l_reg_reads_global_1 = v2461;
                                        else
                                            local v2462 = {};
                                            v2458[v2443] = v2462;
                                            l_reg_reads_global_1 = v2462;
                                        end;
                                        v2458 = v2459[#v2459];
                                        v2461 = l_reg_reads_global_1[#l_reg_reads_global_1];
                                        if v2461 and v2461.code.opname ~= "NAMECALL" and v2458.code.index > v2461.code.index then
                                            v1984(v2395, v2461.reg_range, v2461.code.code_index);
                                        end;
                                    end;
                                end;
                                local v2463 = {
                                    code = v2402, 
                                    location = v2395.location, 
                                    reg_range = {
                                        beginning = v2443, 
                                        ending = v2443
                                    }
                                };
                                local l_reg_reads_1 = v2395.reg_reads;
                                local v2465 = l_reg_reads_1[v2443];
                                local v2466;
                                if v2465 then
                                    v2466 = v2465;
                                else
                                    local v2467 = {};
                                    l_reg_reads_1[v2443] = v2467;
                                    v2466 = v2467;
                                end;
                                table.insert(v2466, v2463);
                                l_reg_reads_1 = v2395.reg_reads_global;
                                v2465 = l_reg_reads_1[v2443];
                                if v2465 then
                                    v2466 = v2465;
                                else
                                    local v2468 = {};
                                    l_reg_reads_1[v2443] = v2468;
                                    v2466 = v2468;
                                end;
                                table.insert(v2466, v2463);
                                local _ = v2463.code;
                                v2466 = v2395.neglected[v2443];
                                if v2466 then
                                    for _ = #v2466, 1, -1 do

                                    end;
                                end;
                            end;
                            for _, v2472 in ipairs(v2412) do
                                if l_reg_has_var_0[v2472] and not v2414[v2472] then
                                    local v2473 = v2395.reg_has_var[v2472];
                                    for v2474 = v2473.beginning, v2473.ending do
                                        v2395.reg_has_var[v2474] = nil;
                                    end;
                                end;
                                v2395.uncertain_regs[v2472] = nil;
                                local v2475 = {
                                    code = v2402, 
                                    location = v2395.location, 
                                    reg_range = v2415
                                };
                                local l_reg_writes_3 = v2395.reg_writes;
                                local v2477 = l_reg_writes_3[v2472];
                                local v2478;
                                if v2477 then
                                    v2478 = v2477;
                                else
                                    local v2479 = {};
                                    l_reg_writes_3[v2472] = v2479;
                                    v2478 = v2479;
                                end;
                                table.insert(v2478, v2475);
                                l_reg_writes_3 = v2395.reg_writes_global;
                                v2477 = l_reg_writes_3[v2472];
                                if v2477 then
                                    v2478 = v2477;
                                else
                                    local v2480 = {};
                                    l_reg_writes_3[v2472] = v2480;
                                    v2478 = v2480;
                                end;
                                table.insert(v2478, v2475);
                                v2478 = {
                                    hl_index = v2395.location.hl_index, 
                                    start_code = v2475.code, 
                                    register = v2472
                                };
                                if v2395.neglected[v2472] then

                                end;
                                local l_neglected_3 = v2395.neglected;
                                local v2482 = l_neglected_3[v2472];
                                if v2482 then
                                    v2477 = v2482;
                                else
                                    local v2483 = {};
                                    l_neglected_3[v2472] = v2483;
                                    v2477 = v2483;
                                end;
                                table.insert(v2477, v2478);
                            end;
                        end;
                        if #v2412 > 1 and v2402.opname ~= "NAMECALL" then
                            v1984(v2395, v2415);
                        end;
                        for _, v2485 in ipairs(v2412) do
                            if #v2403 > 0 then
                                for _, v2487 in ipairs(v2403) do
                                    local l_register_range_4 = v2487.register_range;
                                    local l_beginning_9 = l_register_range_4.beginning;
                                    local l_ending_6 = l_register_range_4.ending;
                                    local v2491 = false;
                                    if l_beginning_9 <= v2485 then
                                        v2491 = v2485 <= l_ending_6;
                                    end;
                                    if v2491 then
                                        v1984(v2395, v2487.register_range, v2402.code_index, nil, true);
                                    end;
                                    v1974(v2395, v2487, v2402.code_index);
                                end;
                                table.clear(v2403);
                            elseif not v2414[v2485] then

                            end;
                        end;
                        if #v2403 > 0 then
                            print(v2403);
                            error("Failed to handle forcedef");
                        end;
                    end;
                end;
                v2018 = function(v2492)
                    local v2493 = v109(v2492.reg_reads);
                    local v2494 = v109(v2492.reg_reads_global);
                    return {
                        reg_has_var = table.clone(v2492.reg_has_var), 
                        reg_forced_var = v2492.reg_forced_var, 
                        reg_reads = v2493, 
                        reg_reads_global = v2494, 
                        reg_writes = {}, 
                        reg_writes_global = v2492.reg_writes_global, 
                        demands = v2492.demands, 
                        observations = v2492.observations, 
                        uncertain_regs = v2492.uncertain_regs, 
                        preprocess_task_index = v2492.preprocess_task_index, 
                        neglected = {}, 
                        location = v2492.location
                    };
                end;
                v2019 = function(v2495, v2496)
                    for v2497, v2498 in pairs(v2496.neglected) do
                        v2495.neglected[v2497] = v2498;
                    end;
                    for v2499, v2500 in pairs(v2496.reg_writes) do
                        if #v2500 > 0 and not v2496.reg_has_var[v2499] then
                            v2495.uncertain_regs[v2499] = {
                                register_range = {
                                    beginning = v2499, 
                                    ending = v2499
                                }, 
                                index = v2500[1].code.index, 
                                location = v2496.location
                            };
                        end;
                    end;
                    for v2501, v2502 in pairs(v2496.reg_reads) do
                        local l_reg_reads_global_2 = v2495.reg_reads_global;
                        local v2504 = l_reg_reads_global_2[v2501];
                        local v2505;
                        if v2504 then
                            v2505 = v2504;
                        else
                            local v2506 = {};
                            l_reg_reads_global_2[v2501] = v2506;
                            v2505 = v2506;
                        end;
                        for _, v2508 in ipairs(v2502) do
                            table.insert(v2505, v2508);
                        end;
                    end;
                end;
                v2027 = nil;
                v2039 = 0;
                v2046 = 0;
                v2051 = #v1364;
                v2062 = {};
                v2066 = function(v2509, v2510, v2511, v2512, v2513)
                    v2046 = v2046 + 1;
                    v33(v2046, v2051, "<VarAnalysisCycle" .. v2039 .. ">");
                    local l_hl_index_6 = v2510.hl_index;
                    local l_location_8 = v2509.location;
                    local v2516 = {
                        hl_index = l_hl_index_6, 
                        depth = if v2512 then l_location_8.depth + 1 else l_location_8.depth, 
                        parent = if v2512 then l_location_8 else l_location_8.parent, 
                        last_loop = l_location_8.last_loop
                    };
                    if v2513 then
                        v2516.last_loop = v2516;
                    end;
                    v2509.location = v2516;
                    if v2511 then
                        v1881[v2510.hl_index] = v2511.hl_index;
                    end;
                    if not v1882[v2510.hl_index] then
                        v1882[v2510.hl_index] = v2509.location;
                    end;
                    if v2510.type == "sequential" then
                        for _, v2518 in ipairs(v2510.data) do
                            v1880[v2518] = v1880[v2510.hl_index];
                            v2066(v2509, v1364[v2518], v2511);
                        end;
                    elseif v2510.type == "single" then
                        v2012(v2509, v2510.hl_index, v2510.data, v2510._visitor);
                    elseif not (v2510.type ~= "ifthen") or v2510.type == "ifthenelse" then
                        local l_data_5 = v2510.data;
                        v2509.location = v2027(v2509, l_data_5.condition, v2510);
                        l_hl_index_6 = v2018(v2509);
                        l_location_8 = nil;
                        if l_data_5.else_ then
                            l_location_8 = v2018(v2509);
                            v1880[l_data_5.else_] = v2510.hl_index;
                            l_location_8.neglected = {};
                            v2066(l_location_8, v1364[l_data_5.else_], v2510, true);
                        end;
                        v1880[l_data_5.pass] = v2510.hl_index;
                        l_hl_index_6.neglected = {};
                        v2066(l_hl_index_6, v1364[l_data_5.pass], v2510, true);
                        v2019(v2509, l_hl_index_6);
                        if l_data_5.else_ then
                            v2019(v2509, l_location_8);
                        end;
                    elseif v2510.type == "oneblockwhile" then
                        local v2520 = v2018(v2509);
                        v2520.neglected = {};
                        l_hl_index_6 = v2510.data;
                        v1880[l_hl_index_6.code] = v2510.hl_index;
                        l_location_8 = l_hl_index_6.for_info;
                        if l_location_8 and not l_location_8.variables then
                            v2516 = nil;
                            if l_location_8.type == "numeric" then
                                local l_index_reg_0 = l_location_8.args.index_reg;
                                local v2522 = {
                                    beginning = l_index_reg_0, 
                                    ending = l_index_reg_0
                                };
                                l_index_reg_0 = {};
                                local v2523 = {};
                                local l_v1223_8 = v1223;
                                local v2525 = "var" .. tostring(v1195);
                                local v2526 = v1213[v2525];
                                local l_v2525_0 = v2525;
                                local v2528 = v2526 or 1;
                                while v1206[l_v2525_0] or v1141[l_v2525_0] do
                                    v2528 = v2528 + 1;
                                    l_v2525_0 = v2525 .. "_" .. v2528;
                                end;
                                v1213[v2525] = v2528;
                                local l_l_v2525_0_0 = l_v2525_0;
                                v1195 = v1195 + 1;
                                local v2530 = l_v1223_8(l_l_v2525_0_0, v2522, v2523);
                                v6(l_index_reg_0, 1, v2530);
                                v2516 = l_index_reg_0;
                            elseif l_location_8.type == "generic" then
                                local _ = l_location_8.args;
                                local v2532 = {};
                                local l_variable_count_0 = l_location_8.variable_count;
                                v2516 = table.create(l_variable_count_0);
                                for _ = 1, l_variable_count_0 do
                                    local l_variables_reg_range_0 = l_location_8.variables_reg_range;
                                    local l_v1223_9 = v1223;
                                    local v2537 = "var" .. tostring(v1195);
                                    local v2538 = v1213[v2537];
                                    local l_v2537_0 = v2537;
                                    local v2540 = v2538 or 1;
                                    while v1206[l_v2537_0] or v1141[l_v2537_0] do
                                        v2540 = v2540 + 1;
                                        l_v2537_0 = v2537 .. "_" .. v2540;
                                    end;
                                    v1213[v2537] = v2540;
                                    local l_l_v2537_0_0 = l_v2537_0;
                                    v1195 = v1195 + 1;
                                    table.insert(v2516, (l_v1223_9(l_l_v2537_0_0, l_variables_reg_range_0, v2532)));
                                end;
                            else
                                error((("Unknown for_info type \"%*\""):format(l_location_8.type)));
                            end;
                            l_location_8.variables = v2516;
                            v2062[l_location_8] = true;
                            v1957(v2520.demands, l_location_8.variables_reg_range, v2510.index, v2509.location, nil, true);
                        end;
                        v2066(v2520, v1364[l_hl_index_6.code], v2510, true, true);
                        v2019(v2509, v2520);
                    else
                        error((("Unknown hl_block type %*"):format(v2510.type)));
                    end;
                    v1898[v2510.hl_index] = v2509;
                end;
                v2070 = function(v2542, v2543, v2544, v2545)
                    local v2546 = nil;
                    if v2543.type == "reg" then
                        assert(v2543.code);
                        local v2547 = v1364[v2543.code];
                        local l_hl_index_7 = v2547.hl_index;
                        local l_location_9 = v2542.location;
                        v2546 = {
                            hl_index = l_hl_index_7, 
                            depth = if v2545 then l_location_9.depth + 1 else l_location_9.depth, 
                            parent = if v2545 then l_location_9 else l_location_9.parent, 
                            last_loop = l_location_9.last_loop
                        };
                        v2542.location = v2546;
                        v2066(v2542, v2547, v2544, nil);
                        return v2546;
                    else
                        local l_hl_index_8 = v2542.location.hl_index;
                        local l_location_10 = v2542.location;
                        v2546 = {
                            hl_index = l_hl_index_8, 
                            depth = if v2545 then l_location_10.depth + 1 else l_location_10.depth, 
                            parent = if v2545 then l_location_10 else l_location_10.parent, 
                            last_loop = l_location_10.last_loop
                        };
                        v2542.location = v2546;
                        l_hl_index_8 = v2543.lhs;
                        if type(l_hl_index_8) == "table" then
                            if l_hl_index_8.is_full_condition_t then
                                v2070(v2542, l_hl_index_8, v2544, v2543.type == "and");
                            end;
                            l_location_10 = v2543.rhs;
                            if type(l_location_10) == "table" and l_location_10.is_full_condition_t then
                                if v2543.type == "and" then
                                    local v2552 = v2018(v2542);
                                    v2546 = v2070(v2552, l_location_10, v2544, nil);
                                    v2019(v2542, v2552);
                                    return v2546;
                                else
                                    v2070(v2542, l_location_10, v2544);
                                end;
                            end;
                        end;
                        return v2546;
                    end;
                end;
                v2027 = v2070;
                v2087 = v1872();
                v2091 = false;
                v2129 = {};
                v2130 = {};
                while true do
                    v2151 = {};
                    v2039 = v2039 + 1;
                    v2046 = 0;
                    if v2039 > 1 then
                        v1357 = {};
                    end;
                    v1898 = {};
                    v1880 = {};
                    v1881 = {};
                    v1882 = {};
                    v1899 = {};
                    v1900 = 0;
                    v1901 = {};
                    v2130 = {};
                    for v2553 in pairs(v2062) do
                        v2553.variables = nil;
                    end;
                    v2062 = {};
                    local v2554 = {
                        hl_index = v2087.hl_index, 
                        depth = 0, 
                        parent = nil
                    };
                    v2066({
                        reg_src = {}, 
                        reg_all_src = {}, 
                        reg_has_var = {}, 
                        reg_forced_var = {}, 
                        reg_reads = {}, 
                        reg_reads_global = {}, 
                        reg_writes = {}, 
                        reg_writes_global = {}, 
                        demands = v2129, 
                        observations = v2130, 
                        uncertain_regs = {}, 
                        preprocess_task_index = v1900, 
                        neglected = v2151, 
                        location = v2554
                    }, v2087, v2087, true);
                    if not next(v2129) then
                        for _, v2556 in ipairs(v2130) do
                            local _ = v2556.location.parent.hl_index;
                            if not v2129[v2556.info.wanted_definition_point] then
                                v1957(v2129, v2556.info.register_range, v2556.info.wanted_definition_point, v2556.info.definition_location, v2556.info.is_predefinition);
                            end;
                        end;
                        if v2039 >= 4 then
                            v2091 = true;
                            break;
                        elseif not (#v2130 ~= 0) then
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                if v2091 then
                    v1374(1, l_prefix_warning_1 .. ": Variable analysis failed. Output will have some incorrect variable assignments");
                end;
                for v2558, v2559 in pairs(v1357) do
                    assert(#v2559 > 0);
                    local v2560 = table.create(#v2559);
                    local v2561 = {};
                    local v2562 = {};
                    local v2563 = {};
                    for v2564 = #v2559, 1, -1 do
                        local v2565 = v2559[v2564];
                        local l_type_5 = v2565.type;
                        if l_type_5 == "defvar" then
                            table.insert(v2561, v2565);
                        elseif l_type_5 == "lockvar" then
                            table.insert(v2562, v2565);
                        else
                            table.insert(v2563, v2565);
                        end;
                    end;
                    for _, v2568 in ipairs(v2561) do
                        table.insert(v2560, v2568);
                    end;
                    for _, v2570 in ipairs(v2562) do
                        table.insert(v2560, v2570);
                    end;
                    for _, v2572 in ipairs(v2563) do
                        table.insert(v2560, v2572);
                    end;
                    v1357[v2558] = v2560;
                end;
                v1348:end_benchmark("Stack Incantation");
                v1348:start_benchmark("AST Generation");
                v2151 = function(v2573, v2574)
                    local v2575;
                    if v1389[v2574] then
                        v2575 = v1388(v2574, v1389[v2574]);
                    else
                        local v2576 = v1355[v2574];
                        if not v2576 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2574) .. "]");
                            v2576 = v1375(v2574, (v1283(true)));
                        end;
                        v2575 = v2576;
                    end;
                    v1355[v2573] = v2575;
                    v1356[v2575] = v2573;
                end;
                local function v2578(_)
                    v1520();
                end;
                local function v2580(_)
                    v1487 = true;
                end;
                local v2581 = nil;
                v2581 = {
                    FASTCALL = v2578, 
                    FASTCALL1 = v2578, 
                    FASTCALL2 = v2578, 
                    FASTCALL2K = v2578, 
                    FASTCALL3 = v2578, 
                    FORNPREP = v2578, 
                    FORGPREP = v2578, 
                    FORGPREP_NEXT = v2578, 
                    FORGPREP_INEXT = v2578, 
                    PREPVARARGS = v2578, 
                    JUMP = v2580, 
                    JUMPBACK = v2580, 
                    JUMPX = v2580, 
                    JUMPIF = v2580, 
                    JUMPIFNOT = v2580, 
                    JUMPIFEQ = v2580, 
                    JUMPIFLE = v2580, 
                    JUMPIFLT = v2580, 
                    JUMPIFNOTEQ = v2580, 
                    JUMPIFNOTLE = v2580, 
                    JUMPIFNOTLT = v2580, 
                    JUMPXEQKNIL = v2580, 
                    JUMPXEQKB = v2580, 
                    JUMPXEQKN = v2580, 
                    JUMPXEQKS = v2580, 
                    FORNLOOP = v2580, 
                    FORGLOOP = v2580, 
                    GETVARARGS = function(v2582)
                        local v2583 = bit32.band(bit32.rshift(v2582, 8), 255);
                        local v2584 = bit32.band(bit32.rshift(v2582, 16), 255) - 1;
                        if v2584 == 0 then
                            v1371(l_prefix_warning_1 .. ": Malformed varargs");
                            return;
                        else
                            if v2584 == -1 then
                                v297 = v2583;
                            end;
                            v1516(v2583, v1540(v2583));
                            return;
                        end;
                    end, 
                    MOVE = function(v2585)
                        local v2586 = bit32.band(bit32.rshift(v2585, 8), 255);
                        local v2587 = bit32.band(bit32.rshift(v2585, 16), 255);
                        local v2588;
                        if v1389[v2587] then
                            v2588 = v1388(v2587, v1389[v2587]);
                        else
                            local v2589 = v1355[v2587];
                            if not v2589 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2587) .. "]");
                                v2589 = v1375(v2587, (v1283(true)));
                            end;
                            v2588 = v2589;
                        end;
                        v1355[v2586] = v2588;
                        v1356[v2588] = v2586;
                        v1516(v2586, v1410(v2587));
                    end, 
                    LOADK = function(v2590)
                        local v2591 = bit32.band(bit32.rshift(v2590, 8), 255);
                        local v2592 = l_constants_1[bit32.band(bit32.rshift(v2590, 16), 65535)];
                        v1516(v2591, v1548(v2591, v2592));
                    end, 
                    LOADKX = function(v2593)
                        local v2594 = bit32.band(bit32.rshift(v2593, 8), 255);
                        local v2595 = l_code_1[v1358 + 1];
                        if not v2595 then
                            error("Expected aux");
                        end;
                        v2595 = l_constants_1[v2595];
                        v1516(v2594, v1548(v2594, v2595));
                    end, 
                    LOADN = function(v2596)
                        local v2597 = bit32.band(bit32.rshift(v2596, 8), 255);
                        buffer.writeu16(v44, 0, (bit32.band(bit32.rshift(v2596, 16), 65535)));
                        v1516(v2597, v1548(v2597, {
                            type = 2, 
                            value = buffer.readi16(v44, 0)
                        }));
                    end, 
                    LOADNIL = function(v2598)
                        local v2599 = bit32.band(bit32.rshift(v2598, 8), 255);
                        v1516(v2599, v1378(v2599));
                    end, 
                    LOADB = function(v2600)
                        local v2601 = bit32.band(bit32.rshift(v2600, 8), 255);
                        local v2602 = bit32.band(bit32.rshift(v2600, 16), 255);
                        assert(v2602 <= 1);
                        v1516(v2601, v1560(v2601, v2602 == 1));
                    end, 
                    NEWTABLE = function(v2603)
                        local v2604 = bit32.band(bit32.rshift(v2603, 8), 255);
                        v1516(v2604, v1550(v2604));
                    end, 
                    DUPTABLE = function(v2605)
                        local v2606 = bit32.band(bit32.rshift(v2605, 8), 255);
                        v1516(v2606, v1550(v2606));
                    end, 
                    SETTABLE = function(v2607)
                        local v2608 = bit32.band(bit32.rshift(v2607, 8), 255);
                        local v2609 = bit32.band(bit32.rshift(v2607, 16), 255);
                        local v2610 = bit32.band(bit32.rshift(v2607, 24), 255);
                        local l_v1446_0 = v1446;
                        local l_v2609_0 = v2609;
                        local v2613;
                        if v1389[v2610] then
                            v2613 = v1388(v2610, v1389[v2610]);
                        else
                            local v2614 = v1355[v2610];
                            if not v2614 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2610) .. "]");
                                v2614 = v1375(v2610, (v1283(true)));
                            end;
                            v2613 = v2614;
                        end;
                        if v1331[v2613] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2613] = true;
                        end;
                        local l_v2613_0 = v2613;
                        local v2616;
                        if v1389[v2608] then
                            v2616 = v1388(v2608, v1389[v2608]);
                        else
                            local v2617 = v1355[v2608];
                            if not v2617 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2608) .. "]");
                                v2617 = v1375(v2608, (v1283(true)));
                            end;
                            v2616 = v2617;
                        end;
                        if v1331[v2616] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2616] = true;
                        end;
                        l_v1446_0(l_v2609_0, l_v2613_0, v2616);
                        v1365();
                        v1520();
                    end, 
                    SETTABLEKS = function(v2618)
                        local v2619 = bit32.band(bit32.rshift(v2618, 8), 255);
                        local v2620 = bit32.band(bit32.rshift(v2618, 16), 255);
                        local l_l_constants_1_0 = l_constants_1;
                        local v2622 = l_code_1[v1358 + 1];
                        if not v2622 then
                            error("Expected aux");
                        end;
                        local v2623 = l_l_constants_1_0[v2622];
                        l_l_constants_1_0 = v1446;
                        local l_v2620_0 = v2620;
                        v2622 = v1548(nil, v2623);
                        local v2625;
                        if v1389[v2619] then
                            v2625 = v1388(v2619, v1389[v2619]);
                        else
                            local v2626 = v1355[v2619];
                            if not v2626 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2619) .. "]");
                                v2626 = v1375(v2619, (v1283(true)));
                            end;
                            v2625 = v2626;
                        end;
                        if v1331[v2625] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2625] = true;
                        end;
                        l_l_constants_1_0(l_v2620_0, v2622, v2625);
                        v1365();
                        v1520();
                    end, 
                    SETTABLEN = function(v2627)
                        local v2628 = bit32.band(bit32.rshift(v2627, 8), 255);
                        local v2629 = bit32.band(bit32.rshift(v2627, 16), 255);
                        local v2630 = bit32.band(bit32.rshift(v2627, 24), 255) + 1;
                        local l_v1446_1 = v1446;
                        local l_v2629_0 = v2629;
                        local v2633 = v1548(nil, {
                            type = 2, 
                            value = v2630
                        });
                        local v2634;
                        if v1389[v2628] then
                            v2634 = v1388(v2628, v1389[v2628]);
                        else
                            local v2635 = v1355[v2628];
                            if not v2635 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2628) .. "]");
                                v2635 = v1375(v2628, (v1283(true)));
                            end;
                            v2634 = v2635;
                        end;
                        if v1331[v2634] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2634] = true;
                        end;
                        l_v1446_1(l_v2629_0, v2633, v2634);
                        v1365();
                        v1520();
                    end, 
                    GETTABLE = function(v2636)
                        local v2637 = bit32.band(bit32.rshift(v2636, 8), 255);
                        local v2638 = bit32.band(bit32.rshift(v2636, 16), 255);
                        local v2639;
                        if v1389[v2638] then
                            v2639 = v1388(v2638, v1389[v2638]);
                        else
                            local v2640 = v1355[v2638];
                            if not v2640 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2638) .. "]");
                                v2640 = v1375(v2638, (v1283(true)));
                            end;
                            v2639 = v2640;
                        end;
                        if v1331[v2639] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2639] = true;
                        end;
                        local l_v2639_0 = v2639;
                        local v2642 = bit32.band(bit32.rshift(v2636, 24), 255);
                        if v1389[v2642] then
                            v2638 = v1388(v2642, v1389[v2642]);
                        else
                            local v2643 = v1355[v2642];
                            if not v2643 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2642) .. "]");
                                v2643 = v1375(v2642, (v1283(true)));
                            end;
                            v2638 = v2643;
                        end;
                        if v1331[v2638] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2638] = true;
                        end;
                        v1516(v2637, v1690(v2637, l_v2639_0, v2638));
                    end, 
                    GETTABLEKS = function(v2644)
                        local v2645 = bit32.band(bit32.rshift(v2644, 8), 255);
                        local v2646 = bit32.band(bit32.rshift(v2644, 16), 255);
                        local v2647;
                        if v1389[v2646] then
                            v2647 = v1388(v2646, v1389[v2646]);
                        else
                            local v2648 = v1355[v2646];
                            if not v2648 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2646) .. "]");
                                v2648 = v1375(v2646, (v1283(true)));
                            end;
                            v2647 = v2648;
                        end;
                        if v1331[v2647] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2647] = true;
                        end;
                        local l_v2647_0 = v2647;
                        v2646 = l_constants_1;
                        local v2650 = l_code_1[v1358 + 1];
                        if not v2650 then
                            error("Expected aux");
                        end;
                        v2647 = v2646[v2650];
                        v1516(v2645, v1690(v2645, l_v2647_0, v1548(nil, v2647)));
                    end, 
                    GETTABLEN = function(v2651)
                        local v2652 = bit32.band(bit32.rshift(v2651, 8), 255);
                        local v2653 = bit32.band(bit32.rshift(v2651, 16), 255);
                        local v2654;
                        if v1389[v2653] then
                            v2654 = v1388(v2653, v1389[v2653]);
                        else
                            local v2655 = v1355[v2653];
                            if not v2655 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2653) .. "]");
                                v2655 = v1375(v2653, (v1283(true)));
                            end;
                            v2654 = v2655;
                        end;
                        if v1331[v2654] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2654] = true;
                        end;
                        local l_v2654_0 = v2654;
                        v2654 = bit32.band(bit32.rshift(v2651, 24), 255) + 1;
                        v1516(v2652, v1690(v2652, l_v2654_0, v1548(nil, {
                            type = 2, 
                            value = v2654
                        })));
                    end, 
                    SETLIST = function(v2657)
                        local v2658 = bit32.band(bit32.rshift(v2657, 8), 255);
                        local v2659 = bit32.band(bit32.rshift(v2657, 16), 255);
                        local v2660 = bit32.band(bit32.rshift(v2657, 24), 255) - 1;
                        local v2661 = l_code_1[v1358 + 1];
                        if not v2661 then
                            error("Expected aux");
                        end;
                        local l_v2661_0 = v2661;
                        if v1389[v2658] then
                            v2661 = v1388(v2658, v1389[v2658]);
                        else
                            local v2663 = v1355[v2658];
                            if not v2663 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2658) .. "]");
                                v2663 = v1375(v2658, (v1283(true)));
                            end;
                            v2661 = v2663;
                        end;
                        local l_v2659_0 = v2659;
                        local v2665 = if v2660 == -1 then v297 else v2659 + v2660 - 1;
                        for v2666 = l_v2659_0, v2665 do
                            local l_v1446_2 = v1446;
                            local l_v2658_0 = v2658;
                            local v2669 = v1548(nil, {
                                type = 2, 
                                value = l_v2661_0
                            });
                            local v2670;
                            if v1389[v2666] then
                                v2670 = v1388(v2666, v1389[v2666]);
                            else
                                local v2671 = v1355[v2666];
                                if not v2671 then
                                    v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2666) .. "]");
                                    v2671 = v1375(v2666, (v1283(true)));
                                end;
                                v2670 = v2671;
                            end;
                            if v1331[v2670] then
                                v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                            else
                                v1331[v2670] = true;
                            end;
                            l_v1446_2(l_v2658_0, v2669, v2670);
                            v1365();
                            l_v2661_0 = l_v2661_0 + 1;
                        end;
                        v1375(v2658, v2661);
                        v1520();
                    end, 
                    GETUPVAL = function(v2672)
                        local v2673 = bit32.band(bit32.rshift(v2672, 8), 255);
                        local v2674 = bit32.band(bit32.rshift(v2672, 16), 255);
                        assert(v1347);
                        local v2675 = v1347.upvalues[v2674];
                        v1516(v2673, v1388(v2673, v2675.name));
                    end, 
                    SETUPVAL = function(v2676)
                        local v2677 = bit32.band(bit32.rshift(v2676, 8), 255);
                        local v2678 = bit32.band(bit32.rshift(v2676, 16), 255);
                        assert(v1347);
                        local v2679 = v1347.upvalues[v2678];
                        local l_v1435_0 = v1435;
                        local l_name_8 = v2679.name;
                        local v2682;
                        if v1389[v2677] then
                            v2682 = v1388(v2677, v1389[v2677]);
                        else
                            local v2683 = v1355[v2677];
                            if not v2683 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2677) .. "]");
                                v2683 = v1375(v2677, (v1283(true)));
                            end;
                            v2682 = v2683;
                        end;
                        if v1331[v2682] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2682] = true;
                        end;
                        l_v1435_0(l_name_8, v2682);
                        v1365();
                        v1520();
                    end, 
                    GETIMPORT = function(v2684)
                        local v2685 = bit32.band(bit32.rshift(v2684, 8), 255);
                        local v2686 = l_code_1[v1358 + 1];
                        if not v2686 then
                            error("Expected aux");
                        end;
                        v2686 = v1698(v2685, v2686);
                        assert(v2686);
                        v1516(v2685, v2686);
                    end, 
                    GETGLOBAL = function(v2687)
                        local v2688 = bit32.band(bit32.rshift(v2687, 8), 255);
                        local l_l_constants_1_1 = l_constants_1;
                        local v2690 = l_code_1[v1358 + 1];
                        if not v2690 then
                            error("Expected aux");
                        end;
                        local v2691 = l_l_constants_1_1[v2690];
                        v1516(v2688, v1543(v2688, v2691));
                    end, 
                    SETGLOBAL = function(v2692)
                        local v2693 = bit32.band(bit32.rshift(v2692, 8), 255);
                        local l_l_constants_1_2 = l_constants_1;
                        local v2695 = l_code_1[v1358 + 1];
                        if not v2695 then
                            error("Expected aux");
                        end;
                        local v2696 = l_l_constants_1_2[v2695];
                        l_l_constants_1_2 = v1439;
                        local l_v2696_0 = v2696;
                        local v2698;
                        if v1389[v2693] then
                            v2698 = v1388(v2693, v1389[v2693]);
                        else
                            local v2699 = v1355[v2693];
                            if not v2699 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2693) .. "]");
                                v2699 = v1375(v2693, (v1283(true)));
                            end;
                            v2698 = v2699;
                        end;
                        if v1331[v2698] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2698] = true;
                        end;
                        l_l_constants_1_2(l_v2696_0, v2698);
                        v1365();
                        v1520();
                    end, 
                    NAMECALL = function(v2700)
                        local v2701 = bit32.band(bit32.rshift(v2700, 8), 255);
                        local v2702 = bit32.band(bit32.rshift(v2700, 16), 255);
                        local l_l_constants_1_3 = l_constants_1;
                        local v2704 = l_code_1[v1358 + 1];
                        if not v2704 then
                            error("Expected aux");
                        end;
                        v1521 = l_l_constants_1_3[v2704] or {
                            type = 3, 
                            value = "<UNK>"
                        };
                        assert(v1521);
                        local v2705;
                        if v1389[v2702] then
                            v2705 = v1388(v2702, v1389[v2702]);
                        else
                            local v2706 = v1355[v2702];
                            if not v2706 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2702) .. "]");
                                v2706 = v1375(v2702, (v1283(true)));
                            end;
                            v2705 = v2706;
                        end;
                        v1355[v2701] = v2705;
                        v1356[v2705] = v2701;
                        if v1389[v2702] then
                            v2705 = v1388(v2702, v1389[v2702]);
                        else
                            local v2707 = v1355[v2702];
                            if not v2707 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2702) .. "]");
                                v2707 = v1375(v2702, (v1283(true)));
                            end;
                            v2705 = v2707;
                        end;
                        l_l_constants_1_3 = v1555(v2701, v2705, v1521, true);
                        assert(l_l_constants_1_3);
                        v1516(v2701, l_l_constants_1_3);
                    end, 
                    RETURN = function(v2708)
                        local v2709 = bit32.band(bit32.rshift(v2708, 8), 255);
                        local v2710 = bit32.band(bit32.rshift(v2708, 16), 255) - 1;
                        if v2710 == 0 and v1359 == #v1362 then
                            v1337[v1203] = true;
                            v1520();
                            return;
                        else
                            v1459(v2709, v2710);
                            v1365();
                            v1520();
                            return;
                        end;
                    end, 
                    CALL = function(v2711)
                        local v2712 = bit32.band(bit32.rshift(v2711, 8), 255);
                        local v2713 = bit32.band(bit32.rshift(v2711, 16), 255) - 1;
                        local v2714 = bit32.band(bit32.rshift(v2711, 24), 255) - 1;
                        if v2713 == -1 then
                            v2713 = v297 - v2712;
                        end;
                        local v2715 = v1715(v2712, v2713, v2714, v1521 and v1521.value);
                        v1521 = nil;
                        if v2714 == -1 then
                            v297 = v2712;
                        end;
                        if v2714 ~= 0 then
                            v1516(v2712, v2715);
                            return;
                        else
                            if v2715.t == "name" then
                                print(debug.traceback());
                            else
                                local v2716 = {
                                    t = "call", 
                                    lines = v1203, 
                                    reads = {}, 
                                    writes = {}, 
                                    func = v2715.func, 
                                    args = v2715.args
                                };
                                v1187(v2716, v2715.func);
                                for _, v2718 in ipairs(v2715.args) do
                                    v1187(v2716, v2718);
                                end;
                                v1363 = v2716;
                                v1365();
                            end;
                            v1520();
                            return;
                        end;
                    end, 
                    CLOSEUPVALS = function(v2719)
                        local v2720 = bit32.band(bit32.rshift(v2719, 8), 255);
                        for v2721 in pairs(table.clone(v1716)) do
                            if v2720 <= v2721 then
                                v1390[v2721] = nil;
                                v1716[v2721] = nil;
                            end;
                        end;
                        v1520();
                    end, 
                    DUPCLOSURE = function(v2722)
                        local v2723 = bit32.band(bit32.rshift(v2722, 8), 255);
                        local v2724 = l_constants_1[bit32.band(bit32.rshift(v2722, 16), 65535)];
                        if v2724.type ~= 6 then
                            v551 = v551 + 1;
                            error("Invalid DUPCLOSURE");
                        end;
                        local v2725 = v1138[v2724.value];
                        v1796(v2723, v2725);
                    end, 
                    NEWCLOSURE = function(v2726)
                        local v2727 = bit32.band(bit32.rshift(v2726, 8), 255);
                        local v2728 = l_protos_1[bit32.band(bit32.rshift(v2726, 16), 65535)];
                        v1796(v2727, v2728);
                    end, 
                    ADD = function(v2729)
                        local v2730 = bit32.band(bit32.rshift(v2729, 8), 255);
                        local v2731 = bit32.band(bit32.rshift(v2729, 16), 255);
                        local v2732 = bit32.band(bit32.rshift(v2729, 24), 255);
                        local l_v1516_0 = v1516;
                        local l_v2730_0 = v2730;
                        local l_v1591_0 = v1591;
                        local l_v2730_1 = v2730;
                        local v2737;
                        if v1389[v2731] then
                            v2737 = v1388(v2731, v1389[v2731]);
                        else
                            local v2738 = v1355[v2731];
                            if not v2738 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2731) .. "]");
                                v2738 = v1375(v2731, (v1283(true)));
                            end;
                            v2737 = v2738;
                        end;
                        if v1331[v2737] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2737] = true;
                        end;
                        local l_v2737_0 = v2737;
                        local v2740;
                        if v1389[v2732] then
                            v2740 = v1388(v2732, v1389[v2732]);
                        else
                            local v2741 = v1355[v2732];
                            if not v2741 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2732) .. "]");
                                v2741 = v1375(v2732, (v1283(true)));
                            end;
                            v2740 = v2741;
                        end;
                        if v1331[v2740] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2740] = true;
                        end;
                        l_v1516_0(l_v2730_0, l_v1591_0(l_v2730_1, l_v2737_0, v2740));
                    end, 
                    ADDK = function(v2742)
                        local v2743 = bit32.band(bit32.rshift(v2742, 8), 255);
                        local v2744 = bit32.band(bit32.rshift(v2742, 16), 255);
                        local v2745 = l_constants_1[bit32.band(bit32.rshift(v2742, 24), 255)];
                        if v2745.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed ADDK (constant wasn't a number)");
                        end;
                        local l_v1516_1 = v1516;
                        local l_v2743_0 = v2743;
                        local l_v1591_1 = v1591;
                        local l_v2743_1 = v2743;
                        local v2750;
                        if v1389[v2744] then
                            v2750 = v1388(v2744, v1389[v2744]);
                        else
                            local v2751 = v1355[v2744];
                            if not v2751 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2744) .. "]");
                                v2751 = v1375(v2744, (v1283(true)));
                            end;
                            v2750 = v2751;
                        end;
                        if v1331[v2750] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2750] = true;
                        end;
                        l_v1516_1(l_v2743_0, l_v1591_1(l_v2743_1, v2750, v1548(nil, v2745)));
                    end, 
                    SUB = function(v2752)
                        local v2753 = bit32.band(bit32.rshift(v2752, 8), 255);
                        local v2754 = bit32.band(bit32.rshift(v2752, 16), 255);
                        local v2755 = bit32.band(bit32.rshift(v2752, 24), 255);
                        local l_v1516_2 = v1516;
                        local l_v2753_0 = v2753;
                        local l_v1602_0 = v1602;
                        local l_v2753_1 = v2753;
                        local v2760;
                        if v1389[v2754] then
                            v2760 = v1388(v2754, v1389[v2754]);
                        else
                            local v2761 = v1355[v2754];
                            if not v2761 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2754) .. "]");
                                v2761 = v1375(v2754, (v1283(true)));
                            end;
                            v2760 = v2761;
                        end;
                        if v1331[v2760] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2760] = true;
                        end;
                        local l_v2760_0 = v2760;
                        local v2763;
                        if v1389[v2755] then
                            v2763 = v1388(v2755, v1389[v2755]);
                        else
                            local v2764 = v1355[v2755];
                            if not v2764 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2755) .. "]");
                                v2764 = v1375(v2755, (v1283(true)));
                            end;
                            v2763 = v2764;
                        end;
                        if v1331[v2763] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2763] = true;
                        end;
                        l_v1516_2(l_v2753_0, l_v1602_0(l_v2753_1, l_v2760_0, v2763));
                    end, 
                    SUBK = function(v2765)
                        local v2766 = bit32.band(bit32.rshift(v2765, 8), 255);
                        local v2767 = bit32.band(bit32.rshift(v2765, 16), 255);
                        local v2768 = l_constants_1[bit32.band(bit32.rshift(v2765, 24), 255)];
                        if v2768.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed SUBK (constant wasn't a number)");
                        end;
                        local l_v1516_3 = v1516;
                        local l_v2766_0 = v2766;
                        local l_v1602_1 = v1602;
                        local l_v2766_1 = v2766;
                        local v2773;
                        if v1389[v2767] then
                            v2773 = v1388(v2767, v1389[v2767]);
                        else
                            local v2774 = v1355[v2767];
                            if not v2774 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2767) .. "]");
                                v2774 = v1375(v2767, (v1283(true)));
                            end;
                            v2773 = v2774;
                        end;
                        if v1331[v2773] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2773] = true;
                        end;
                        l_v1516_3(l_v2766_0, l_v1602_1(l_v2766_1, v2773, v1548(nil, v2768)));
                    end, 
                    MUL = function(v2775)
                        local v2776 = bit32.band(bit32.rshift(v2775, 8), 255);
                        local v2777 = bit32.band(bit32.rshift(v2775, 16), 255);
                        local v2778 = bit32.band(bit32.rshift(v2775, 24), 255);
                        local l_v1516_4 = v1516;
                        local l_v2776_0 = v2776;
                        local l_v1613_0 = v1613;
                        local l_v2776_1 = v2776;
                        local v2783;
                        if v1389[v2777] then
                            v2783 = v1388(v2777, v1389[v2777]);
                        else
                            local v2784 = v1355[v2777];
                            if not v2784 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2777) .. "]");
                                v2784 = v1375(v2777, (v1283(true)));
                            end;
                            v2783 = v2784;
                        end;
                        if v1331[v2783] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2783] = true;
                        end;
                        local l_v2783_0 = v2783;
                        local v2786;
                        if v1389[v2778] then
                            v2786 = v1388(v2778, v1389[v2778]);
                        else
                            local v2787 = v1355[v2778];
                            if not v2787 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2778) .. "]");
                                v2787 = v1375(v2778, (v1283(true)));
                            end;
                            v2786 = v2787;
                        end;
                        if v1331[v2786] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2786] = true;
                        end;
                        l_v1516_4(l_v2776_0, l_v1613_0(l_v2776_1, l_v2783_0, v2786));
                    end, 
                    MULK = function(v2788)
                        local v2789 = bit32.band(bit32.rshift(v2788, 8), 255);
                        local v2790 = bit32.band(bit32.rshift(v2788, 16), 255);
                        local v2791 = l_constants_1[bit32.band(bit32.rshift(v2788, 24), 255)];
                        if v2791.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed MULK (constant wasn't a number)");
                        end;
                        local l_v1516_5 = v1516;
                        local l_v2789_0 = v2789;
                        local l_v1613_1 = v1613;
                        local l_v2789_1 = v2789;
                        local v2796;
                        if v1389[v2790] then
                            v2796 = v1388(v2790, v1389[v2790]);
                        else
                            local v2797 = v1355[v2790];
                            if not v2797 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2790) .. "]");
                                v2797 = v1375(v2790, (v1283(true)));
                            end;
                            v2796 = v2797;
                        end;
                        if v1331[v2796] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2796] = true;
                        end;
                        l_v1516_5(l_v2789_0, l_v1613_1(l_v2789_1, v2796, v1548(nil, v2791)));
                    end, 
                    DIV = function(v2798)
                        local v2799 = bit32.band(bit32.rshift(v2798, 8), 255);
                        local v2800 = bit32.band(bit32.rshift(v2798, 16), 255);
                        local v2801 = bit32.band(bit32.rshift(v2798, 24), 255);
                        local l_v1516_6 = v1516;
                        local l_v2799_0 = v2799;
                        local l_v1624_0 = v1624;
                        local l_v2799_1 = v2799;
                        local v2806;
                        if v1389[v2800] then
                            v2806 = v1388(v2800, v1389[v2800]);
                        else
                            local v2807 = v1355[v2800];
                            if not v2807 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2800) .. "]");
                                v2807 = v1375(v2800, (v1283(true)));
                            end;
                            v2806 = v2807;
                        end;
                        if v1331[v2806] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2806] = true;
                        end;
                        local l_v2806_0 = v2806;
                        local v2809;
                        if v1389[v2801] then
                            v2809 = v1388(v2801, v1389[v2801]);
                        else
                            local v2810 = v1355[v2801];
                            if not v2810 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2801) .. "]");
                                v2810 = v1375(v2801, (v1283(true)));
                            end;
                            v2809 = v2810;
                        end;
                        if v1331[v2809] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2809] = true;
                        end;
                        l_v1516_6(l_v2799_0, l_v1624_0(l_v2799_1, l_v2806_0, v2809));
                    end, 
                    DIVK = function(v2811)
                        local v2812 = bit32.band(bit32.rshift(v2811, 8), 255);
                        local v2813 = bit32.band(bit32.rshift(v2811, 16), 255);
                        local v2814 = l_constants_1[bit32.band(bit32.rshift(v2811, 24), 255)];
                        if v2814.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed DIVK (constant wasn't a number)");
                        end;
                        local l_v1516_7 = v1516;
                        local l_v2812_0 = v2812;
                        local l_v1624_1 = v1624;
                        local l_v2812_1 = v2812;
                        local v2819;
                        if v1389[v2813] then
                            v2819 = v1388(v2813, v1389[v2813]);
                        else
                            local v2820 = v1355[v2813];
                            if not v2820 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2813) .. "]");
                                v2820 = v1375(v2813, (v1283(true)));
                            end;
                            v2819 = v2820;
                        end;
                        if v1331[v2819] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2819] = true;
                        end;
                        l_v1516_7(l_v2812_0, l_v1624_1(l_v2812_1, v2819, v1548(nil, v2814)));
                    end, 
                    SUBRK = function(v2821)
                        local v2822 = bit32.band(bit32.rshift(v2821, 8), 255);
                        local v2823 = l_constants_1[bit32.band(bit32.rshift(v2821, 16), 255)];
                        local v2824 = bit32.band(bit32.rshift(v2821, 24), 255);
                        if v2823.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed SUBRK (constant wasn't a number)");
                        end;
                        local l_v1516_8 = v1516;
                        local l_v2822_0 = v2822;
                        local l_v1602_2 = v1602;
                        local l_v2822_1 = v2822;
                        local v2829 = v1548(nil, v2823);
                        local v2830;
                        if v1389[v2824] then
                            v2830 = v1388(v2824, v1389[v2824]);
                        else
                            local v2831 = v1355[v2824];
                            if not v2831 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2824) .. "]");
                                v2831 = v1375(v2824, (v1283(true)));
                            end;
                            v2830 = v2831;
                        end;
                        if v1331[v2830] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2830] = true;
                        end;
                        l_v1516_8(l_v2822_0, l_v1602_2(l_v2822_1, v2829, v2830));
                    end, 
                    DIVRK = function(v2832)
                        local v2833 = bit32.band(bit32.rshift(v2832, 8), 255);
                        local v2834 = l_constants_1[bit32.band(bit32.rshift(v2832, 16), 255)];
                        local v2835 = bit32.band(bit32.rshift(v2832, 24), 255);
                        if v2834.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed DIVRK (constant wasn't a number)");
                        end;
                        local l_v1516_9 = v1516;
                        local l_v2833_0 = v2833;
                        local l_v1624_2 = v1624;
                        local l_v2833_1 = v2833;
                        local v2840 = v1548(nil, v2834);
                        local v2841;
                        if v1389[v2835] then
                            v2841 = v1388(v2835, v1389[v2835]);
                        else
                            local v2842 = v1355[v2835];
                            if not v2842 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2835) .. "]");
                                v2842 = v1375(v2835, (v1283(true)));
                            end;
                            v2841 = v2842;
                        end;
                        if v1331[v2841] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2841] = true;
                        end;
                        l_v1516_9(l_v2833_0, l_v1624_2(l_v2833_1, v2840, v2841));
                    end, 
                    IDIV = function(v2843)
                        local v2844 = bit32.band(bit32.rshift(v2843, 8), 255);
                        local v2845 = bit32.band(bit32.rshift(v2843, 16), 255);
                        local v2846 = bit32.band(bit32.rshift(v2843, 24), 255);
                        local l_v1516_10 = v1516;
                        local l_v2844_0 = v2844;
                        local l_v1635_0 = v1635;
                        local l_v2844_1 = v2844;
                        local v2851;
                        if v1389[v2845] then
                            v2851 = v1388(v2845, v1389[v2845]);
                        else
                            local v2852 = v1355[v2845];
                            if not v2852 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2845) .. "]");
                                v2852 = v1375(v2845, (v1283(true)));
                            end;
                            v2851 = v2852;
                        end;
                        if v1331[v2851] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2851] = true;
                        end;
                        local l_v2851_0 = v2851;
                        local v2854;
                        if v1389[v2846] then
                            v2854 = v1388(v2846, v1389[v2846]);
                        else
                            local v2855 = v1355[v2846];
                            if not v2855 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2846) .. "]");
                                v2855 = v1375(v2846, (v1283(true)));
                            end;
                            v2854 = v2855;
                        end;
                        if v1331[v2854] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2854] = true;
                        end;
                        l_v1516_10(l_v2844_0, l_v1635_0(l_v2844_1, l_v2851_0, v2854));
                    end, 
                    IDIVK = function(v2856)
                        local v2857 = bit32.band(bit32.rshift(v2856, 8), 255);
                        local v2858 = bit32.band(bit32.rshift(v2856, 16), 255);
                        local v2859 = l_constants_1[bit32.band(bit32.rshift(v2856, 24), 255)];
                        if v2859.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed DIVK (constant wasn't a number)");
                        end;
                        local l_v1516_11 = v1516;
                        local l_v2857_0 = v2857;
                        local l_v1635_1 = v1635;
                        local l_v2857_1 = v2857;
                        local v2864;
                        if v1389[v2858] then
                            v2864 = v1388(v2858, v1389[v2858]);
                        else
                            local v2865 = v1355[v2858];
                            if not v2865 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2858) .. "]");
                                v2865 = v1375(v2858, (v1283(true)));
                            end;
                            v2864 = v2865;
                        end;
                        if v1331[v2864] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2864] = true;
                        end;
                        l_v1516_11(l_v2857_0, l_v1635_1(l_v2857_1, v2864, v1548(nil, v2859)));
                    end, 
                    POW = function(v2866)
                        local v2867 = bit32.band(bit32.rshift(v2866, 8), 255);
                        local v2868 = bit32.band(bit32.rshift(v2866, 16), 255);
                        local v2869 = bit32.band(bit32.rshift(v2866, 24), 255);
                        local l_v1516_12 = v1516;
                        local l_v2867_0 = v2867;
                        local l_v1666_0 = v1666;
                        local l_v2867_1 = v2867;
                        local v2874;
                        if v1389[v2868] then
                            v2874 = v1388(v2868, v1389[v2868]);
                        else
                            local v2875 = v1355[v2868];
                            if not v2875 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2868) .. "]");
                                v2875 = v1375(v2868, (v1283(true)));
                            end;
                            v2874 = v2875;
                        end;
                        if v1331[v2874] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2874] = true;
                        end;
                        local l_v2874_0 = v2874;
                        local v2877;
                        if v1389[v2869] then
                            v2877 = v1388(v2869, v1389[v2869]);
                        else
                            local v2878 = v1355[v2869];
                            if not v2878 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2869) .. "]");
                                v2878 = v1375(v2869, (v1283(true)));
                            end;
                            v2877 = v2878;
                        end;
                        if v1331[v2877] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2877] = true;
                        end;
                        l_v1516_12(l_v2867_0, l_v1666_0(l_v2867_1, l_v2874_0, v2877));
                    end, 
                    POWK = function(v2879)
                        local v2880 = bit32.band(bit32.rshift(v2879, 8), 255);
                        local v2881 = bit32.band(bit32.rshift(v2879, 16), 255);
                        local v2882 = l_constants_1[bit32.band(bit32.rshift(v2879, 24), 255)];
                        if v2882.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed POWK (constant wasn't a number)");
                        end;
                        local l_v1516_13 = v1516;
                        local l_v2880_0 = v2880;
                        local l_v1666_1 = v1666;
                        local l_v2880_1 = v2880;
                        local v2887;
                        if v1389[v2881] then
                            v2887 = v1388(v2881, v1389[v2881]);
                        else
                            local v2888 = v1355[v2881];
                            if not v2888 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2881) .. "]");
                                v2888 = v1375(v2881, (v1283(true)));
                            end;
                            v2887 = v2888;
                        end;
                        if v1331[v2887] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2887] = true;
                        end;
                        l_v1516_13(l_v2880_0, l_v1666_1(l_v2880_1, v2887, v1548(nil, v2882)));
                    end, 
                    MOD = function(v2889)
                        local v2890 = bit32.band(bit32.rshift(v2889, 8), 255);
                        local v2891 = bit32.band(bit32.rshift(v2889, 16), 255);
                        local v2892 = bit32.band(bit32.rshift(v2889, 24), 255);
                        local l_v1516_14 = v1516;
                        local l_v2890_0 = v2890;
                        local l_v1646_0 = v1646;
                        local l_v2890_1 = v2890;
                        local v2897;
                        if v1389[v2891] then
                            v2897 = v1388(v2891, v1389[v2891]);
                        else
                            local v2898 = v1355[v2891];
                            if not v2898 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2891) .. "]");
                                v2898 = v1375(v2891, (v1283(true)));
                            end;
                            v2897 = v2898;
                        end;
                        if v1331[v2897] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2897] = true;
                        end;
                        local l_v2897_0 = v2897;
                        local v2900;
                        if v1389[v2892] then
                            v2900 = v1388(v2892, v1389[v2892]);
                        else
                            local v2901 = v1355[v2892];
                            if not v2901 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2892) .. "]");
                                v2901 = v1375(v2892, (v1283(true)));
                            end;
                            v2900 = v2901;
                        end;
                        if v1331[v2900] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2900] = true;
                        end;
                        l_v1516_14(l_v2890_0, l_v1646_0(l_v2890_1, l_v2897_0, v2900));
                    end, 
                    MODK = function(v2902)
                        local v2903 = bit32.band(bit32.rshift(v2902, 8), 255);
                        local v2904 = bit32.band(bit32.rshift(v2902, 16), 255);
                        local v2905 = l_constants_1[bit32.band(bit32.rshift(v2902, 24), 255)];
                        if v2905.type ~= 2 then
                            v1371(l_prefix_warning_1 .. ": Malformed MODK (constant wasn't a number)");
                        end;
                        local l_v1516_15 = v1516;
                        local l_v2903_0 = v2903;
                        local l_v1646_1 = v1646;
                        local l_v2903_1 = v2903;
                        local v2910;
                        if v1389[v2904] then
                            v2910 = v1388(v2904, v1389[v2904]);
                        else
                            local v2911 = v1355[v2904];
                            if not v2911 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2904) .. "]");
                                v2911 = v1375(v2904, (v1283(true)));
                            end;
                            v2910 = v2911;
                        end;
                        if v1331[v2910] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2910] = true;
                        end;
                        l_v1516_15(l_v2903_0, l_v1646_1(l_v2903_1, v2910, v1548(nil, v2905)));
                    end, 
                    AND = function(v2912)
                        local v2913 = bit32.band(bit32.rshift(v2912, 8), 255);
                        local v2914 = bit32.band(bit32.rshift(v2912, 16), 255);
                        local v2915 = bit32.band(bit32.rshift(v2912, 24), 255);
                        local l_v1516_16 = v1516;
                        local l_v2913_0 = v2913;
                        local l_v1575_0 = v1575;
                        local l_v2913_1 = v2913;
                        local v2920;
                        if v1389[v2914] then
                            v2920 = v1388(v2914, v1389[v2914]);
                        else
                            local v2921 = v1355[v2914];
                            if not v2921 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2914) .. "]");
                                v2921 = v1375(v2914, (v1283(true)));
                            end;
                            v2920 = v2921;
                        end;
                        if v1331[v2920] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2920] = true;
                        end;
                        local l_v2920_0 = v2920;
                        local v2923;
                        if v1389[v2915] then
                            v2923 = v1388(v2915, v1389[v2915]);
                        else
                            local v2924 = v1355[v2915];
                            if not v2924 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2915) .. "]");
                                v2924 = v1375(v2915, (v1283(true)));
                            end;
                            v2923 = v2924;
                        end;
                        if v1331[v2923] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2923] = true;
                        end;
                        l_v1516_16(l_v2913_0, l_v1575_0(l_v2913_1, l_v2920_0, v2923));
                    end, 
                    ANDK = function(v2925)
                        local v2926 = bit32.band(bit32.rshift(v2925, 8), 255);
                        local v2927 = bit32.band(bit32.rshift(v2925, 16), 255);
                        local v2928 = l_constants_1[bit32.band(bit32.rshift(v2925, 24), 255)];
                        local l_v1516_17 = v1516;
                        local l_v2926_0 = v2926;
                        local l_v1575_1 = v1575;
                        local l_v2926_1 = v2926;
                        local v2933;
                        if v1389[v2927] then
                            v2933 = v1388(v2927, v1389[v2927]);
                        else
                            local v2934 = v1355[v2927];
                            if not v2934 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2927) .. "]");
                                v2934 = v1375(v2927, (v1283(true)));
                            end;
                            v2933 = v2934;
                        end;
                        if v1331[v2933] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2933] = true;
                        end;
                        l_v1516_17(l_v2926_0, l_v1575_1(l_v2926_1, v2933, v1548(nil, v2928)));
                    end, 
                    OR = function(v2935)
                        local v2936 = bit32.band(bit32.rshift(v2935, 8), 255);
                        local v2937 = bit32.band(bit32.rshift(v2935, 16), 255);
                        local v2938 = bit32.band(bit32.rshift(v2935, 24), 255);
                        local l_v1516_18 = v1516;
                        local l_v2936_0 = v2936;
                        local l_v1571_0 = v1571;
                        local l_v2936_1 = v2936;
                        local v2943;
                        if v1389[v2937] then
                            v2943 = v1388(v2937, v1389[v2937]);
                        else
                            local v2944 = v1355[v2937];
                            if not v2944 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2937) .. "]");
                                v2944 = v1375(v2937, (v1283(true)));
                            end;
                            v2943 = v2944;
                        end;
                        if v1331[v2943] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2943] = true;
                        end;
                        local l_v2943_0 = v2943;
                        local v2946;
                        if v1389[v2938] then
                            v2946 = v1388(v2938, v1389[v2938]);
                        else
                            local v2947 = v1355[v2938];
                            if not v2947 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2938) .. "]");
                                v2947 = v1375(v2938, (v1283(true)));
                            end;
                            v2946 = v2947;
                        end;
                        if v1331[v2946] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2946] = true;
                        end;
                        l_v1516_18(l_v2936_0, l_v1571_0(l_v2936_1, l_v2943_0, v2946));
                    end, 
                    ORK = function(v2948)
                        local v2949 = bit32.band(bit32.rshift(v2948, 8), 255);
                        local v2950 = bit32.band(bit32.rshift(v2948, 16), 255);
                        local v2951 = l_constants_1[bit32.band(bit32.rshift(v2948, 24), 255)];
                        local l_v1516_19 = v1516;
                        local l_v2949_0 = v2949;
                        local l_v1571_1 = v1571;
                        local l_v2949_1 = v2949;
                        local v2956;
                        if v1389[v2950] then
                            v2956 = v1388(v2950, v1389[v2950]);
                        else
                            local v2957 = v1355[v2950];
                            if not v2957 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2950) .. "]");
                                v2957 = v1375(v2950, (v1283(true)));
                            end;
                            v2956 = v2957;
                        end;
                        if v1331[v2956] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2956] = true;
                        end;
                        l_v1516_19(l_v2949_0, l_v1571_1(l_v2949_1, v2956, v1548(nil, v2951)));
                    end, 
                    CONCAT = function(v2958)
                        local v2959 = bit32.band(bit32.rshift(v2958, 8), 255);
                        local v2960 = bit32.band(bit32.rshift(v2958, 16), 255);
                        local v2961 = bit32.band(bit32.rshift(v2958, 24), 255);
                        local v2962 = {};
                        for v2963 = v2960, v2961 do
                            local v2964;
                            if v1389[v2963] then
                                v2964 = v1388(v2963, v1389[v2963]);
                            else
                                local v2965 = v1355[v2963];
                                if not v2965 then
                                    v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2963) .. "]");
                                    v2965 = v1375(v2963, (v1283(true)));
                                end;
                                v2964 = v2965;
                            end;
                            if v1331[v2964] then
                                v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                            else
                                v1331[v2964] = true;
                            end;
                            table.insert(v2962, v2964);
                        end;
                        v1516(v2959, v1679(v2959, v2962));
                    end, 
                    NOT = function(v2966)
                        local v2967 = bit32.band(bit32.rshift(v2966, 8), 255);
                        local v2968 = bit32.band(bit32.rshift(v2966, 16), 255);
                        local l_v1516_20 = v1516;
                        local l_v2967_0 = v2967;
                        local l_v1649_0 = v1649;
                        local l_v2967_1 = v2967;
                        local v2973;
                        if v1389[v2968] then
                            v2973 = v1388(v2968, v1389[v2968]);
                        else
                            local v2974 = v1355[v2968];
                            if not v2974 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2968) .. "]");
                                v2974 = v1375(v2968, (v1283(true)));
                            end;
                            v2973 = v2974;
                        end;
                        if v1331[v2973] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2973] = true;
                        end;
                        l_v1516_20(l_v2967_0, l_v1649_0(l_v2967_1, v2973));
                    end, 
                    MINUS = function(v2975)
                        local v2976 = bit32.band(bit32.rshift(v2975, 8), 255);
                        local v2977 = bit32.band(bit32.rshift(v2975, 16), 255);
                        local l_v1516_21 = v1516;
                        local l_v2976_0 = v2976;
                        local l_v1652_0 = v1652;
                        local l_v2976_1 = v2976;
                        local v2982;
                        if v1389[v2977] then
                            v2982 = v1388(v2977, v1389[v2977]);
                        else
                            local v2983 = v1355[v2977];
                            if not v2983 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2977) .. "]");
                                v2983 = v1375(v2977, (v1283(true)));
                            end;
                            v2982 = v2983;
                        end;
                        if v1331[v2982] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2982] = true;
                        end;
                        l_v1516_21(l_v2976_0, l_v1652_0(l_v2976_1, v2982));
                    end, 
                    LENGTH = function(v2984)
                        local v2985 = bit32.band(bit32.rshift(v2984, 8), 255);
                        local v2986 = bit32.band(bit32.rshift(v2984, 16), 255);
                        local l_v1516_22 = v1516;
                        local l_v2985_0 = v2985;
                        local l_v1655_0 = v1655;
                        local l_v2985_1 = v2985;
                        local v2991;
                        if v1389[v2986] then
                            v2991 = v1388(v2986, v1389[v2986]);
                        else
                            local v2992 = v1355[v2986];
                            if not v2992 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v2986) .. "]");
                                v2992 = v1375(v2986, (v1283(true)));
                            end;
                            v2991 = v2992;
                        end;
                        if v1331[v2991] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v2991] = true;
                        end;
                        l_v1516_22(l_v2985_0, l_v1655_0(l_v2985_1, v2991));
                    end, 
                    NATIVECALL = function(_)
                        local v2994 = v1203[#v1203];
                        if v2994 and v2994.t == "comment" and string.sub(v2994.text, 1, 12) == "<NATIVECALL>" then
                            v2994.stack = v2994.stack + 1;
                            v2994.text = "<NATIVECALL>" .. " (x" .. v2994.stack .. ")";
                        else
                            v1363 = v1205("<NATIVECALL>");
                            v1365();
                        end;
                        v1520();
                    end, 
                    BREAK = function(_)
                        local v2996 = v1203[#v1203];
                        if v2996 and v2996.t == "comment" and string.sub(v2996.text, 1, 12) == "<DEBUGBREAK>" then
                            v2996.stack = v2996.stack + 1;
                            v2996.text = "<DEBUGBREAK>" .. " (x" .. v2996.stack .. ")";
                        else
                            v1363 = v1205("<DEBUGBREAK>");
                            v1365();
                        end;
                        v1520();
                    end, 
                    NOP = function(_)
                        local v2998 = v1203[#v1203];
                        if v2998 and v2998.t == "comment" and string.sub(v2998.text, 1, 5) == "<NOP>" then
                            v2998.stack = v2998.stack + 1;
                            v2998.text = "<NOP>" .. " (x" .. v2998.stack .. ")";
                        else
                            v1363 = v1205("<NOP>");
                            v1365();
                        end;
                        v1520();
                    end, 
                    COVERAGE = function(_)
                        local v3000 = v1203[#v1203];
                        if v3000 and v3000.t == "comment" and string.sub(v3000.text, 1, 10) == "<COVERAGE>" then
                            v3000.stack = v3000.stack + 1;
                            v3000.text = "<COVERAGE>" .. " (x" .. v3000.stack .. ")";
                        else
                            v1363 = v1205("<COVERAGE>");
                            v1365();
                        end;
                        v1520();
                    end
                };
                local v3001 = {};
                for v3002, v3003 in pairs(v2581) do
                    local v3004 = v180[v3002];
                    if v3004 then
                        v3001[v3004.opcode] = v3003;
                    end;
                end;
                local _ = {};
                local function v3013(v3006, v3007)
                    local l_v1203_2 = v1203;
                    v1203 = v3006;
                    for _, v3010 in ipairs(v3007) do
                        if v1359 < v3010.index then
                            v1359 = v3010.index;
                            v1358 = v3010.code_index;
                            local v3011 = v1362[v1359];
                            local v3012 = v3001[v3011.opcode];
                            if v3012 then
                                v1496();
                                v3012(v3011.inst);
                                if not v1487 then
                                    error(v3011.opname);
                                end;
                            else
                                v1371((("%*: Skipped instruction %*"):format(l_prefix_warning_1, v3011.opname)));
                            end;
                        end;
                    end;
                    v1203 = l_v1203_2;
                end;
                local v3014 = nil;
                local function v3017(_, _)
                    v1520();
                end;
                local function v3026(v3018, _)
                    local v3020 = bit32.band(bit32.rshift(v3018, 8), 255);
                    local v3021 = v1280[v1358];
                    local l_v1187_0 = v1187;
                    local l_v3021_0 = v3021;
                    local v3024;
                    if v1389[v3020] then
                        v3024 = v1388(v3020, v1389[v3020]);
                    else
                        local v3025 = v1355[v3020];
                        if not v3025 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3020) .. "]");
                            v3025 = v1375(v3020, (v1283(true)));
                        end;
                        v3024 = v3025;
                    end;
                    if v1331[v3024] then
                        v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    else
                        v1331[v3024] = true;
                    end;
                    l_v1187_0(l_v3021_0, v3024);
                    v1520();
                end;
                local function v3037(v3027, _)
                    local v3029 = bit32.band(bit32.rshift(v3027, 8), 255);
                    local v3030 = l_code_1[v1358 + 1];
                    if not v3030 then
                        error("Expected aux");
                    end;
                    local l_v3030_0 = v3030;
                    v3030 = v1280[v1358];
                    local l_v1187_1 = v1187;
                    local l_v3030_1 = v3030;
                    local v3034;
                    if v1389[v3029] then
                        v3034 = v1388(v3029, v1389[v3029]);
                    else
                        local v3035 = v1355[v3029];
                        if not v3035 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3029) .. "]");
                            v3035 = v1375(v3029, (v1283(true)));
                        end;
                        v3034 = v3035;
                    end;
                    if v1331[v3034] then
                        v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    else
                        v1331[v3034] = true;
                    end;
                    l_v1187_1(l_v3030_1, v3034);
                    l_v1187_1 = v1187;
                    l_v3030_1 = v3030;
                    if v1389[l_v3030_0] then
                        v3034 = v1388(l_v3030_0, v1389[l_v3030_0]);
                    else
                        local v3036 = v1355[l_v3030_0];
                        if not v3036 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_v3030_0) .. "]");
                            v3036 = v1375(l_v3030_0, (v1283(true)));
                        end;
                        v3034 = v3036;
                    end;
                    if v1331[v3034] then
                        v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    else
                        v1331[v3034] = true;
                    end;
                    l_v1187_1(l_v3030_1, v3034);
                    v1520();
                end;
                local function v3046(v3038, _)
                    local v3040 = bit32.band(bit32.rshift(v3038, 8), 255);
                    if not l_code_1[v1358 + 1] then
                        error("Expected aux");
                    end;
                    local v3041 = v1280[v1358];
                    local l_v1187_2 = v1187;
                    local l_v3041_0 = v3041;
                    local v3044;
                    if v1389[v3040] then
                        v3044 = v1388(v3040, v1389[v3040]);
                    else
                        local v3045 = v1355[v3040];
                        if not v3045 then
                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3040) .. "]");
                            v3045 = v1375(v3040, (v1283(true)));
                        end;
                        v3044 = v3045;
                    end;
                    if v1331[v3044] then
                        v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                    else
                        v1331[v3044] = true;
                    end;
                    l_v1187_2(l_v3041_0, v3044);
                    v1520();
                end;
                local v3069 = {
                    JUMP = v3017, 
                    JUMPX = v3017, 
                    JUMPBACK = v3017, 
                    JUMPIF = v3026, 
                    JUMPIFNOT = v3026, 
                    JUMPIFEQ = v3037, 
                    JUMPIFLE = v3037, 
                    JUMPIFLT = v3037, 
                    JUMPIFNOTEQ = v3037, 
                    JUMPIFNOTLE = v3037, 
                    JUMPIFNOTLT = v3037, 
                    JUMPXEQKNIL = v3046, 
                    JUMPXEQKB = v3046, 
                    JUMPXEQKN = v3046, 
                    JUMPXEQKS = v3046, 
                    FORNLOOP = function(v3047, _)
                        local v3049 = bit32.band(bit32.rshift(v3047, 8), 255);
                        local v3050 = v1280[v1358];
                        local l_v1187_3 = v1187;
                        local l_v3050_0 = v3050;
                        local v3053;
                        if v1389[v3049] then
                            v3053 = v1388(v3049, v1389[v3049]);
                        else
                            local v3054 = v1355[v3049];
                            if not v3054 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3049) .. "]");
                                v3054 = v1375(v3049, (v1283(true)));
                            end;
                            v3053 = v3054;
                        end;
                        if v1331[v3053] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v3053] = true;
                        end;
                        l_v1187_3(l_v3050_0, v3053);
                        l_v1187_3 = v1187;
                        l_v3050_0 = v3050;
                        local v3055 = v3049 + 1;
                        if v1389[v3055] then
                            v3053 = v1388(v3055, v1389[v3055]);
                        else
                            local v3056 = v1355[v3055];
                            if not v3056 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3055) .. "]");
                                v3056 = v1375(v3055, (v1283(true)));
                            end;
                            v3053 = v3056;
                        end;
                        if v1331[v3053] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v3053] = true;
                        end;
                        l_v1187_3(l_v3050_0, v3053);
                        v1520();
                    end, 
                    FORGLOOP = function(v3057, v3058)
                        local v3059 = bit32.band(bit32.rshift(v3057, 8), 255);
                        local v3060 = v1280[v1358];
                        local l_v1187_4 = v1187;
                        local l_v3060_0 = v3060;
                        local v3063;
                        if v1389[v3059] then
                            v3063 = v1388(v3059, v1389[v3059]);
                        else
                            local v3064 = v1355[v3059];
                            if not v3064 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3059) .. "]");
                                v3064 = v1375(v3059, (v1283(true)));
                            end;
                            v3063 = v3064;
                        end;
                        if v1331[v3063] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v3063] = true;
                        end;
                        l_v1187_4(l_v3060_0, v3063);
                        l_v1187_4 = v1187;
                        l_v3060_0 = v3060;
                        local v3065 = v3059 + 1;
                        if v1389[v3065] then
                            v3063 = v1388(v3065, v1389[v3065]);
                        else
                            local v3066 = v1355[v3065];
                            if not v3066 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3065) .. "]");
                                v3066 = v1375(v3065, (v1283(true)));
                            end;
                            v3063 = v3066;
                        end;
                        if v1331[v3063] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v3063] = true;
                        end;
                        l_v1187_4(l_v3060_0, v3063);
                        l_v1187_4 = v1187;
                        l_v3060_0 = v3060;
                        v3065 = v3059 + 2;
                        if v1389[v3065] then
                            v3063 = v1388(v3065, v1389[v3065]);
                        else
                            local v3067 = v1355[v3065];
                            if not v3067 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(v3065) .. "]");
                                v3067 = v1375(v3065, (v1283(true)));
                            end;
                            v3063 = v3067;
                        end;
                        if v1331[v3063] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v3063] = true;
                        end;
                        l_v1187_4(l_v3060_0, v3063);
                        assert(v3058);
                        for _ = 1, bit32.band(v3058, 255) do

                        end;
                        v1520();
                    end
                };
                local function v3070(v3071, v3072, v3073)
                    local v3074 = nil;
                    if v3073 then
                        v3074 = v1203;
                        v1203 = v3071;
                        v1350 = v1350 + 1;
                    end;
                    local v3075 = false;
                    if v3072.analysis_failed then
                        if v3072.type == "single" and #v3072.data == 0 and not v3072.jump then
                            v3075 = true;
                        else
                            v1371((("%*: [%*] %*. Error Block %* start (CF ANALYSIS FAILED)"):format(l_prefix_error_1, v3072.actual_code_index, v3072.actual_index, v3072.hl_index)));
                        end;
                    end;
                    if not v3075 then
                        if v3072.type == "single" then
                            v3013(v3071, v3072.data);
                            local l__visitor_9 = v3072._visitor;
                            if l__visitor_9 then
                                local l_code_5 = l__visitor_9.code;
                                local v3078 = v3069[l_code_5.opname];
                                if v3078 then
                                    v1496();
                                    v3078(l_code_5.inst, l_code_5.aux);
                                end;
                            end;
                        elseif v3072.type == "oneblockwhile" then
                            local v3079 = {};
                            local l_data_6 = v3072.data;
                            local v3081 = nil;
                            local l_for_info_0 = l_data_6.for_info;
                            if l_for_info_0 then
                                v3081 = {
                                    t = "for", 
                                    lines = v1203, 
                                    reads = {}, 
                                    writes = {}, 
                                    code = v3079, 
                                    for_info = l_for_info_0
                                };
                                local l_variables_0 = l_for_info_0.variables;
                                assert(l_variables_0);
                                for v3084, v3085 in ipairs(l_variables_0) do
                                    v3085.init_expr = v3081;
                                    v3085.var_num = v3084;
                                    local l_v3081_0 = v3081;
                                    table.insert(l_v3081_0.writes, v3085);
                                    table.insert(v3085.writes, l_v3081_0);
                                end;
                                local l_type_6 = l_for_info_0.type;
                                if l_type_6 == "numeric" then
                                    local l_args_1 = l_for_info_0.args;
                                    local l_index_reg_1 = l_args_1.index_reg;
                                    local v3090;
                                    if v1389[l_index_reg_1] then
                                        v3090 = v1388(l_index_reg_1, v1389[l_index_reg_1]);
                                    else
                                        local v3091 = v1355[l_index_reg_1];
                                        if not v3091 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_index_reg_1) .. "]");
                                            v3091 = v1375(l_index_reg_1, (v1283(true)));
                                        end;
                                        v3090 = v3091;
                                    end;
                                    l_args_1.index_expr = v3090;
                                    assert(l_args_1.index_expr);
                                    v1187(v3081, l_args_1.index_expr);
                                    l_index_reg_1 = l_args_1.end_reg;
                                    if v1389[l_index_reg_1] then
                                        v3090 = v1388(l_index_reg_1, v1389[l_index_reg_1]);
                                    else
                                        local v3092 = v1355[l_index_reg_1];
                                        if not v3092 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_index_reg_1) .. "]");
                                            v3092 = v1375(l_index_reg_1, (v1283(true)));
                                        end;
                                        v3090 = v3092;
                                    end;
                                    l_args_1.end_expr = v3090;
                                    assert(l_args_1.end_expr);
                                    v1187(v3081, l_args_1.end_expr);
                                    l_index_reg_1 = l_args_1.step_reg;
                                    if v1389[l_index_reg_1] then
                                        v3090 = v1388(l_index_reg_1, v1389[l_index_reg_1]);
                                    else
                                        local v3093 = v1355[l_index_reg_1];
                                        if not v3093 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_index_reg_1) .. "]");
                                            v3093 = v1375(l_index_reg_1, (v1283(true)));
                                        end;
                                        v3090 = v3093;
                                    end;
                                    l_args_1.step_expr = v3090;
                                    assert(l_args_1.step_expr);
                                    v1187(v3081, l_args_1.step_expr);
                                    assert(#l_variables_0 == 1);
                                    v1389[l_args_1.index_reg] = l_variables_0[1];
                                elseif l_type_6 == "generic" then
                                    local l_args_2 = l_for_info_0.args;
                                    local l_generator_reg_0 = l_args_2.generator_reg;
                                    local v3096;
                                    if v1389[l_generator_reg_0] then
                                        v3096 = v1388(l_generator_reg_0, v1389[l_generator_reg_0]);
                                    else
                                        local v3097 = v1355[l_generator_reg_0];
                                        if not v3097 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_generator_reg_0) .. "]");
                                            v3097 = v1375(l_generator_reg_0, (v1283(true)));
                                        end;
                                        v3096 = v3097;
                                    end;
                                    l_args_2.generator_expr = v3096;
                                    l_generator_reg_0 = l_args_2.state_reg;
                                    if v1389[l_generator_reg_0] then
                                        v3096 = v1388(l_generator_reg_0, v1389[l_generator_reg_0]);
                                    else
                                        local v3098 = v1355[l_generator_reg_0];
                                        if not v3098 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_generator_reg_0) .. "]");
                                            v3098 = v1375(l_generator_reg_0, (v1283(true)));
                                        end;
                                        v3096 = v3098;
                                    end;
                                    l_args_2.state_expr = v3096;
                                    l_generator_reg_0 = l_args_2.index_reg;
                                    if v1389[l_generator_reg_0] then
                                        v3096 = v1388(l_generator_reg_0, v1389[l_generator_reg_0]);
                                    else
                                        local v3099 = v1355[l_generator_reg_0];
                                        if not v3099 then
                                            v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_generator_reg_0) .. "]");
                                            v3099 = v1375(l_generator_reg_0, (v1283(true)));
                                        end;
                                        v3096 = v3099;
                                    end;
                                    l_args_2.index_expr = v3096;
                                    for v3100, v3101 in ipairs(l_variables_0) do
                                        assert(v3101.var_num == v3100);
                                        v1389[l_for_info_0.variables_reg_range.beginning + v3100 - 1] = v3101;
                                    end;
                                else
                                    error((("Unknown for loop type %*"):format(l_type_6)));
                                end;
                                local l__visitor_10 = v3072._visitor;
                                assert(l__visitor_10);
                                local v3103 = v1280[l__visitor_10.code.code_index];
                                local l_v3081_1 = v3081;
                                table.clear(v3103);
                                for v3105, v3106 in pairs(l_v3081_1) do
                                    v3103[v3105] = v3106;
                                end;
                                v3070(v3079, v1364[l_data_6.code], true);
                            else
                                v3081 = {
                                    t = "while", 
                                    lines = v1203, 
                                    reads = {}, 
                                    writes = {}, 
                                    code = v3079, 
                                    expr = nil
                                };
                                v3070(v3079, v1364[l_data_6.code], true);
                            end;
                            for _, v3108 in ipairs(v3079) do
                                v3108.parent = v3081;
                            end;
                            table.insert(v1203, v3081);
                        elseif v3072.type == "sequential" then
                            for _, v3110 in ipairs(v3072.data) do
                                v3070(v3071, v1364[v3110]);
                            end;
                        elseif not (v3072.type ~= "ifthen") or v3072.type == "ifthenelse" then
                            local l_data_7 = v3072.data;
                            local v3112 = true;
                            local l_condition_3 = l_data_7.condition;
                            while true do
                                if l_condition_3.type == "and" then
                                    local l_lhs_1 = l_condition_3.lhs;
                                    if type(l_lhs_1) == "table" and l_lhs_1.type ~= "reg" then
                                        v3112 = nil;
                                        break;
                                    else
                                        local l_rhs_3 = l_condition_3.rhs;
                                        if type(l_rhs_3) == "table" then
                                            if l_rhs_3.type == "and" then
                                                l_condition_3 = l_rhs_3;
                                            elseif not (l_rhs_3.type == "reg") then
                                                v3112 = nil;
                                                break;
                                            else
                                                break;
                                            end;
                                        else
                                            break;
                                        end;
                                    end;
                                else
                                    v3112 = nil;
                                    break;
                                end;
                            end;
                            local v3116 = v3014(v3071, l_data_7.condition, v3112, true);
                            local v3117 = {};
                            v3070(v3117, v1364[l_data_7.pass], true);
                            local v3118 = nil;
                            if l_data_7.else_ then
                                v3118 = {};
                                v3070(v3118, v1364[l_data_7.else_], true);
                            end;
                            local v3119 = {
                                t = "if", 
                                lines = v1203, 
                                reads = {}, 
                                writes = {}, 
                                pass = v3117, 
                                elseifs = {}, 
                                else_ = v3118, 
                                expr = v3116
                            };
                            for _, v3121 in ipairs(v3117) do
                                v3121.parent = v3119;
                            end;
                            if v3118 then
                                for _, v3123 in ipairs(v3118) do
                                    v3123.parent = v3119;
                                end;
                            end;
                            table.insert(v1203, v3119);
                        else
                            error((("Unknown hl_block type \"%*\""):format(v3072.type)));
                        end;
                        local l_jump_7 = v3072.jump;
                        if l_jump_7 then
                            local l_type_7 = l_jump_7.type;
                            if l_type_7 == "break" then
                                v1460();
                            elseif l_type_7 == "continue" then
                                v1461();
                            elseif l_type_7 == "goto" then
                                v1463(l_jump_7.destination);
                            else
                                error((("Unknown jump_type \"%*\""):format(l_type_7)));
                            end;
                            v1365();
                        end;
                        if v3072.analysis_failed then
                            v1371((("%*: [%*] %*. Error Block %* end (CF ANALYSIS FAILED)"):format(l_prefix_error_1, v1827[v3072.code_index], v1828[v3072.index], v3072.hl_index)));
                        end;
                    end;
                    if v3073 then
                        v1203 = v3074;
                        v1350 = v1350 - 1;
                    end;
                end;
                v3014 = function(v3126, v3127, v3128, v3129)
                    if v3127.type == "reg" then
                        assert(v3127.code);
                        assert(type(v3127.lhs) == "number");
                        local v3130 = #v1203;
                        local v3131 = v1203[#v1203];
                        v3070(v3126, v1364[v3127.code]);
                        local v3132;
                        if type(v3127.lhs) == "number" then
                            local l_lhs_2 = v3127.lhs;
                            if v1389[l_lhs_2] then
                                v3132 = v1388(l_lhs_2, v1389[l_lhs_2]);
                            else
                                local v3134 = v1355[l_lhs_2];
                                if not v3134 then
                                    v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_lhs_2) .. "]");
                                    v3134 = v1375(l_lhs_2, (v1283(true)));
                                end;
                                v3132 = v3134;
                            end;
                        else
                            v3132 = v3127.lhs;
                        end;
                        local v3135 = nil;
                        if v3127.rhs then
                            if type(v3127.rhs) == "number" then
                                local l_rhs_4 = v3127.rhs;
                                if v1389[l_rhs_4] then
                                    v3135 = v1388(l_rhs_4, v1389[l_rhs_4]);
                                else
                                    local v3137 = v1355[l_rhs_4];
                                    if not v3137 then
                                        v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_rhs_4) .. "]");
                                        v3137 = v1375(l_rhs_4, (v1283(true)));
                                    end;
                                    v3135 = v3137;
                                end;
                            else
                                v3135 = v3127.rhs;
                            end;
                        end;
                        if not v3129 and v3130 < #v1203 and v3131 ~= v1203[#v1203] then
                            if v3128 then
                                v1338[v1869[v1364[v3127.code].index].index] = true;
                                v1339 = v1339 + 1;
                            else
                                local v3138 = {};
                                while v3130 < #v1203 do
                                    local v3139 = table.remove(v1203);
                                    assert(v3139);
                                    local l_v3139_0 = v3139;
                                    l_v3139_0.lines = v3138;
                                    table.insert(v3138, l_v3139_0);
                                end;
                                local l_v3132_0 = v3132;
                                if v3135 then
                                    local l_v3132_1 = v3132;
                                    local l_condition_4 = v3127.condition;
                                    l_v3132_0 = v1375(nil, (v1318(l_v3132_1, l_condition_4, v3135)));
                                    v3127.condition = "exist";
                                    v3127.rhs = nil;
                                    v3135 = nil;
                                end;
                                table.insert(v3138, (v1328(v3138, {
                                    l_v3132_0
                                })));
                                local l_INLINED_0 = v1213.INLINED;
                                local v3145 = "INLINED";
                                local v3146 = l_INLINED_0 or 1;
                                while v1206[v3145] or v1141[v3145] do
                                    v3146 = v3146 + 1;
                                    v3145 = "INLINED" .. "_" .. v3146;
                                end;
                                v1213.INLINED = v3146;
                                local l_v3145_0 = v3145;
                                l_INLINED_0 = v1223(l_v3145_0, {
                                    beginning = -1, 
                                    ending = -1
                                }, {});
                                v3132 = v1297(v1388(nil, l_INLINED_0), {}, false);
                                v3145 = {
                                    t = "function", 
                                    reads = {}, 
                                    writes = {}, 
                                    contributors = {}, 
                                    is_self_referencing = false, 
                                    name = l_v3145_0, 
                                    varname = l_INLINED_0, 
                                    name_known = true, 
                                    args = {}, 
                                    is_vararg = false, 
                                    line_defined = -1, 
                                    upvalues_count = 0, 
                                    upvalues = {}, 
                                    ast = v3138
                                };
                                table.insert(v3145.writes, l_INLINED_0);
                                table.insert(v1203, (v1325(v1203, v3145, l_INLINED_0, "local")));
                            end;
                        end;
                        v3127.lhs = v3132;
                        v3127.rhs = v3135;
                    end;
                    local v3148 = nil;
                    local l_lhs_3 = v3127.lhs;
                    assert(l_lhs_3);
                    if type(l_lhs_3) == "number" then
                        local v3150;
                        if v1389[l_lhs_3] then
                            v3150 = v1388(l_lhs_3, v1389[l_lhs_3]);
                        else
                            local v3151 = v1355[l_lhs_3];
                            if not v3151 then
                                v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_lhs_3) .. "]");
                                v3151 = v1375(l_lhs_3, (v1283(true)));
                            end;
                            v3150 = v3151;
                        end;
                        if v1331[v3150] then
                            v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                        else
                            v1331[v3150] = true;
                        end;
                        v3148 = v3150;
                        error("messgage");
                    else
                        v3148 = if l_lhs_3.is_full_condition_t then v3014(v3126, l_lhs_3, v3128, v3129) else l_lhs_3;
                    end;
                    v3127.lhs = v3148;
                    local v3152 = nil;
                    local l_rhs_5 = v3127.rhs;
                    if l_rhs_5 then
                        if type(l_rhs_5) == "number" then
                            local v3154;
                            if v1389[l_rhs_5] then
                                v3154 = v1388(l_rhs_5, v1389[l_rhs_5]);
                            else
                                local v3155 = v1355[l_rhs_5];
                                if not v3155 then
                                    v1371(l_prefix_warning_1 .. ": Failed to evaluate expression, replaced with nil [" .. tostring(v1358) .. "." .. tostring(l_rhs_5) .. "]");
                                    v3155 = v1375(l_rhs_5, (v1283(true)));
                                end;
                                v3154 = v3155;
                            end;
                            if v1331[v3154] then
                                v1371(l_prefix_error_1 .. ": Expression was reused, decompilation is incorrect");
                            else
                                v1331[v3154] = true;
                            end;
                            v3152 = v3154;
                            error("messagee");
                        else
                            v3152 = if l_rhs_5.is_full_condition_t then v3014(v3126, l_rhs_5, v3128) else l_rhs_5;
                        end;
                    end;
                    if v3127.type ~= "reg" then
                        assert(v3152);
                        if v3127.type == "and" then
                            v3148 = v1375(nil, (v1309(v3148, v3152)));
                        elseif v3127.type == "or" then
                            v3148 = v1571(nil, v3148, v3152);
                        else
                            error("Impossible!!!!!!!!!!!!!!!!!!!!!!!!!");
                        end;
                        v3152 = nil;
                    end;
                    if v3152 then
                        return v1580(nil, v3148, v3127.condition, v3152);
                    elseif v3127.condition == "not exist" then
                        return v1649(nil, v3148);
                    else
                        return v3148;
                    end;
                end;
                v3070(v1203, v1872());
                for _, v3157 in l_constants_1 do
                    if v3157.type == 4 and type(v3157.value) == "number" then
                        v3157.value = v1698(nil, v3157.value);
                    end;
                end;
                v1348:end_benchmark("AST Generation");
                v300 = l_v300_0;
                v1348:print_all_times();
                return v1203;
            end;
        end;
        v1345 = function(v3159, v3160)
            local v3161 = v1342();
            local v3163, v3164 = xpcall(v3158, function(v3162)
                return tostring(v3162) .. "\nTraceback:\n" .. debug.traceback(nil, 2);
            end, v3159, v3160);
            local l_v1338_0 = v1338;
            if v3163 then
                if v1339 > v3161.marked_condition_stop_points then
                    v551 = v3161.global_failed_instructions_count;
                    v1142 = v3161.notices;
                    v1203 = v3161.lines;
                    v1332 = v3161.variable_mapped_long_string_constants;
                    v1333 = v3161.variable_mapped_long_string_constants_order;
                    v1334 = v3161.long_string_usage_counts;
                    v1335 = v3161.long_string_constant_already_used;
                    v1336 = v3161.long_string_variable_count;
                    v1337 = v3161.lines_had_skipped_return;
                    v1338 = v3161.condition_stop_points;
                    v1339 = v3161.marked_condition_stop_points;
                    v1338 = l_v1338_0;
                    return v1345(v3159, v3160);
                else
                    return v3164;
                end;
            else
                v551 = v3161.global_failed_instructions_count;
                v1142 = v3161.notices;
                v1203 = v3161.lines;
                v1332 = v3161.variable_mapped_long_string_constants;
                v1333 = v3161.variable_mapped_long_string_constants_order;
                v1334 = v3161.long_string_usage_counts;
                v1335 = v3161.long_string_constant_already_used;
                v1336 = v3161.long_string_variable_count;
                v1337 = v3161.lines_had_skipped_return;
                v1338 = v3161.condition_stop_points;
                v1339 = v3161.marked_condition_stop_points;
                if v3159.debug_name then
                    return {
                        (v1205(l_prefix_error_1 .. ": Failed to generate AST for function `" .. tostring(v3159.debug_name) .. "`:\n" .. tostring(v3164)))
                    };
                else
                    return {
                        (v1205(l_prefix_error_1 .. ": Failed to generate AST for unnamed function:\n" .. tostring(v3164)))
                    };
                end;
            end;
        end;
        v1128:end_benchmark("Global Initialization");
        v1128:start_benchmark("Global Mapping");
        for _, v3167 in pairs(v1138) do
            local v3168 = 0;
            local l_code_6 = v3167.code;
            local v3170 = #l_code_6;
            while v3168 < v3170 do
                local v3171 = v181[bit32.band(l_code_6[v3168], 255)];
                if v3171 then
                    if v3171.opname == "SETGLOBAL" then
                        local v3172 = l_code_6[v3168 + 1];
                        local v3173 = v3167.constants[v3172];
                        if v3173 then
                            if v3173.type == 3 then
                                v1141[v3173.value] = true;
                            else
                                local v3174 = v24[v3173.type];
                                if v3174 then
                                    local v3175 = {
                                        type = "warning", 
                                        content = ("A SETGLOBAL instruction specified a%* %* constant. Expected a string."):format(v61[string.sub(v3174, 1, 1)] and "n" or "", v3174)
                                    };
                                    table.insert(v1142, v3175);
                                else
                                    table.insert(v1142, {
                                        type = "warning", 
                                        content = "A SETGLOBAL instruction specified a constant with an invalid type."
                                    });
                                end;
                            end;
                        else
                            table.insert(v1142, {
                                type = "warning", 
                                content = "A SETGLOBAL instruction specified an invalid constant."
                            });
                        end;
                    end;
                    v3168 = v3168 + v3171.size;
                else
                    v3168 = v3168 + 1;
                end;
            end;
        end;
        v1128:end_benchmark("Global Mapping");
        v1128:start_benchmark("Global Decompilation");
        local v3176 = v1345(v1137);
        v1128:end_benchmark("Global Decompilation");
        v1128:start_benchmark("Global High Level Reductions");
        local v3177 = nil;
        local function _()
            v3177 = v3177 + 1;
        end;
        local v3179 = nil;
        local v3180 = nil;
        local v3181 = nil;
        local function v3183(v3182)
            v3180(v3182.lhs);
            if v3182.rhs then
                v3180(v3182.rhs);
            end;
        end;
        local function v3185(v3184)
            v3180(v3184.rhs);
        end;
        local function v3187(_)

        end;
        local v3188 = nil;
        local v3210 = {
            ["nil"] = v3187, 
            boolean = v3187, 
            global = v3187, 
            varargs = v3187, 
            addition = v3183, 
            subtraction = v3183, 
            multiplication = v3183, 
            division = v3183, 
            exponentiation = v3183, 
            ["floor division"] = v3183, 
            modulus = v3183, 
            ["and"] = v3183, 
            ["or"] = v3183, 
            condition = v3183, 
            negate = v3185, 
            ["not"] = function(v3189)
                local v3190 = 1;
                local l_v3189_0 = v3189;
                while l_v3189_0.rhs.t == "not" do
                    v3190 = v3190 + 1;
                    l_v3189_0 = l_v3189_0.rhs;
                end;
                local l_rhs_6 = l_v3189_0.rhs;
                if v3190 > 2 then
                    if v3190 % 2 == 0 then
                        v3189.rhs.rhs = l_rhs_6;
                    else
                        v3189.rhs = l_rhs_6;
                    end;
                end;
                v3180(v3189.rhs);
            end, 
            length = v3185, 
            concatenation = function(v3193)
                for _, v3195 in ipairs(v3193.exprs) do
                    v3180(v3195);
                end;
            end, 
            name = function(v3196)
                local l_override_expr_2 = v3196.name.override_expr;
                if l_override_expr_2 then
                    v3180(l_override_expr_2);
                end;
            end, 
            constant = function(v3198)
                local l_const_0 = v3198.const;
                if l_const_0.type == 4 then
                    v3180(l_const_0.value);
                end;
            end, 
            ["constant index"] = function(v3200)
                local l_index_4 = v3200.index;
                if l_index_4.type == 4 then
                    v3180(l_index_4.value);
                end;
                v3180(v3200.table);
            end, 
            ["new table"] = function(v3202)
                for v3203, v3204 in pairs(v3202.initializers) do
                    if type(v3203) == "table" then
                        v3180(v3203);
                        v3180(v3204);
                    else
                        v3180(v3204);
                    end;
                end;
            end, 
            ["function"] = function(v3205)
                v3179(v3205.ast);
            end, 
            call = function(v3206)
                v3180(v3206.func);
                for _, v3208 in ipairs(v3206.args) do
                    v3180(v3208);
                end;
            end, 
            ["get table"] = function(v3209)
                v3180(v3209.table);
                v3180(v3209.index);
            end
        };
        v3180 = function(v3211)
            if v3188[v3211] then
                return;
            else
                v3188[v3211] = true;
                local v3212 = v3210[v3211.t];
                if v3212 then
                    v3212(v3211);
                    return;
                else
                    print(v3211);
                    error((("Unknown expr type %*"):format(v3211.t)));
                    return;
                end;
            end;
        end;
        local function v3213(v3214)
            local l_condition_5 = v3214.condition;
            if l_condition_5 ~= "exist" and l_condition_5 ~= "not exist" then
                local l_rhs_7 = v3214.rhs;
                if type(l_rhs_7) == "number" then
                    error("This should NOT have happened");
                    return;
                elseif l_rhs_7.is_full_condition_t then
                    v3213(l_rhs_7);
                    return;
                else
                    v3180(l_rhs_7);
                end;
            end;
        end;
        local function v3233(v3217, v3218, v3219, v3220, v3221)
            local l_lines_0 = v3217.lines;
            local v3223 = table.find(l_lines_0, v3217);
            assert(v3223);
            assert(v3218.t == "function");
            if v3221 then
                assert(v3217.t == "set table");
            end;
            local v3224 = v1325(l_lines_0, v3218, v3219, v3220, v3221);
            v3224.reads = v3217.reads;
            v3224.writes = v3217.writes;
            for _, v3226 in ipairs(v3217.reads) do
                local l_reads_0 = v3226.reads;
                local v3228 = table.find(l_reads_0, v3217);
                assert(v3228);
                l_reads_0[v3228] = v3224;
            end;
            for _, v3230 in ipairs(v3217.writes) do
                local l_writes_0 = v3230.writes;
                local v3232 = table.find(l_writes_0, v3217);
                assert(v3232);
                l_writes_0[v3232] = v3224;
            end;
            l_lines_0[v3223] = v3224;
            v3177 = v3177 + 1;
        end;
        local function v3235(_)

        end;
        local function v3251(v3236)
            local l_value_2 = v3236.value;
            while l_value_2.t == "name" do
                local l_override_expr_3 = l_value_2.name.override_expr;
                if l_override_expr_3 then
                    l_value_2 = l_override_expr_3;
                else
                    break;
                end;
            end;
            local l_l_value_2_0 = l_value_2;
            l_value_2 = v3236.lines;
            assert(l_value_2[v3181] == v3236);
            local v3240 = v3181 + 1;
            while true do
                local v3241 = l_value_2[v3240];
                if v3241 and v3241.t == "set table" then
                    local l_table_0 = v3241.table;
                    while l_table_0.t == "name" do
                        local l_override_expr_4 = l_table_0.name.override_expr;
                        if l_override_expr_4 then
                            l_table_0 = l_override_expr_4;
                        else
                            break;
                        end;
                    end;
                    local l_l_table_0_0 = l_table_0;
                    if l_l_table_0_0.t == "name" then
                        l_table_0 = l_l_table_0_0.name;
                        if l_l_value_2_0 == l_table_0.init_expr then
                            local l_value_3 = v3241.value;
                            while l_value_3.t == "name" do
                                local l_override_expr_5 = l_value_3.name.override_expr;
                                if l_override_expr_5 then
                                    l_value_3 = l_override_expr_5;
                                else
                                    break;
                                end;
                            end;
                            local l_l_value_3_0 = l_value_3;
                            if l_l_value_3_0.t == "name" then
                                if not (l_l_value_3_0.name.init_expr and l_l_value_3_0.name ~= l_table_0) then
                                    break;
                                end;
                            elseif l_l_value_3_0.contributors[l_l_value_2_0] then
                                break;
                            end;
                            local l_key_0 = v3241.key;
                            while l_key_0.t == "name" do
                                local l_override_expr_6 = l_key_0.name.override_expr;
                                if l_override_expr_6 then
                                    l_key_0 = l_override_expr_6;
                                else
                                    break;
                                end;
                            end;
                            l_value_3 = l_key_0;
                            if not l_value_3.contributors[l_l_value_2_0] then
                                if l_value_3.t == "constant" then
                                    l_key_0 = l_value_3.const;
                                    if l_key_0.type == 2 then
                                        local l_value_4 = l_key_0.value;
                                        table.insert(l_l_value_2_0.initializers_order, l_value_4);
                                        l_l_value_2_0.initializers[l_value_4] = l_l_value_3_0;
                                        table.remove(l_value_2, v3240);
                                        v1175(v3241, l_table_0);
                                        v3177 = v3177 + 1;
                                        continue;
                                    end;
                                end;
                                table.insert(l_l_value_2_0.initializers_order, l_value_3);
                                l_l_value_2_0.initializers[l_value_3] = l_l_value_3_0;
                                table.remove(l_value_2, v3240);
                                v1175(v3241, l_table_0);
                                v3177 = v3177 + 1;
                            else
                                break;
                            end;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                else
                    break;
                end;
            end;
        end;
        local function _(v3252)
            if v3252.t == "if" and not v3252.else_ and #v3252.elseifs == 0 then
                local l_pass_0 = v3252.pass;
                if #l_pass_0 == 1 and l_pass_0[1].t == "break" then
                    return true;
                end;
            end;
        end;
        local function v3255(v3256)
            if v1337[v3256] then
                return true;
            elseif #v3256 == 0 then
                return false;
            else
                local v3257 = v3256[#v3256];
                if not (v3257.t ~= "return" and v3257.t ~= "break") or v3257.t == "continue" then
                    return true, v3257;
                elseif v3257.t == "do" then
                    return v3255(v3257.content);
                else
                    return false;
                end;
            end;
        end;
        local function _(v3258)
            if not v3258 then
                return "empty return";
            else
                local l_t_1 = v3258.t;
                if l_t_1 == "return" then
                    if #v3258.values == 0 then
                        return "empty return";
                    end;
                elseif l_t_1 == "break" then
                    return "break";
                elseif l_t_1 == "continue" then
                    return "continue";
                end;
                return;
            end;
        end;
        local v3261 = {};
        local v3357 = {
            comment = v3235, 
            ["break"] = v3235, 
            continue = v3235, 
            ["unknown jump"] = v3235, 
            ["define variable"] = function(v3262)
                local l_value_5 = v3262.value;
                while l_value_5.t == "name" do
                    local l_override_expr_7 = l_value_5.name.override_expr;
                    if l_override_expr_7 then
                        l_value_5 = l_override_expr_7;
                    else
                        break;
                    end;
                end;
                local l_l_value_5_0 = l_value_5;
                if l_l_value_5_0.t == "new table" then
                    v3251(v3262);
                end;
                v3180(l_l_value_5_0);
            end, 
            ["set global"] = function(v3266)
                v3180(v3266.value);
            end, 
            ["define function"] = function(v3267)
                v3180(v3267.func);
            end, 
            call = function(v3268)
                v3180(v3268.func);
                for _, v3270 in ipairs(v3268.args) do
                    v3180(v3270);
                end;
            end, 
            ["set table"] = function(v3271)
                v3180(v3271.table);
                v3180(v3271.key);
                v3180(v3271.value);
            end, 
            ["set variable"] = function(v3272)
                v3180(v3272.value);
            end, 
            ["return"] = function(v3273)
                local l_lines_1 = v3273.lines;
                local v3275 = table.find(l_lines_1, v3273);
                assert(v3275);
                if l_lines_1[v3275 + 1] or v1337[l_lines_1] then
                    local v3276 = {
                        v3273
                    };
                    l_lines_1[v3275] = {
                        t = "do", 
                        lines = l_lines_1, 
                        reads = {}, 
                        writes = {}, 
                        content = v3276
                    };
                    v3273.lines = v3276;
                    v3177 = v3177 + 1;
                end;
                for _, v3278 in ipairs(v3273.values) do
                    v3180(v3278);
                end;
            end, 
            ["if"] = function(v3279)
                v3180(v3279.expr);
                v3179(v3279.pass);
                for _, v3281 in ipairs(v3279.elseifs) do
                    v3180(v3281.expr);
                    v3179(v3281.code);
                end;
                local l_else__3 = v3279.else_;
                if l_else__3 then
                    if #l_else__3 == 1 then
                        local v3283 = l_else__3[1];
                        while v3283.t == "if" do
                            table.insert(v3279.elseifs, {
                                expr = v3283.expr, 
                                code = v3283.pass
                            });
                            v3177 = v3177 + 1;
                            l_else__3 = v3283.else_;
                            v3279.else_ = l_else__3;
                            if l_else__3 and #l_else__3 == 1 then
                                v3283 = l_else__3[1];
                            else
                                break;
                            end;
                        end;
                        return;
                    else
                        v3179(l_else__3);
                        return;
                    end;
                else
                    if v1129.assume_if_else then
                        local l_lines_2 = v3279.lines;
                        local v3285 = table.find(l_lines_2, v3279);
                        assert(v3285);
                        if v3285 < #l_lines_2 then
                            local l_pass_1 = v3279.pass;
                            local v3287, v3288;
                            if v1337[l_pass_1] then
                                v3287 = true;
                                v3288 = nil;
                            elseif #l_pass_1 == 0 then
                                v3287 = false;
                                v3288 = nil;
                            else
                                local v3289 = l_pass_1[#l_pass_1];
                                if not (v3289.t ~= "return" and v3289.t ~= "break") or v3289.t == "continue" then
                                    v3287 = true;
                                    v3288 = v3289;
                                elseif v3289.t == "do" then
                                    local v3290, v3291 = v3255(v3289.content);
                                    v3287 = v3290;
                                    v3288 = v3291;
                                else
                                    v3287 = false;
                                    v3288 = nil;
                                end;
                            end;
                            if v3287 then
                                local v3292;
                                if v1337[l_lines_2] then
                                    l_pass_1 = true;
                                    v3292 = nil;
                                elseif #l_lines_2 == 0 then
                                    l_pass_1 = false;
                                    v3292 = nil;
                                else
                                    local v3293 = l_lines_2[#l_lines_2];
                                    if not (v3293.t ~= "return" and v3293.t ~= "break") or v3293.t == "continue" then
                                        l_pass_1 = true;
                                        v3292 = v3293;
                                    elseif v3293.t == "do" then
                                        local v3294, v3295 = v3255(v3293.content);
                                        l_pass_1 = v3294;
                                        v3292 = v3295;
                                    else
                                        l_pass_1 = false;
                                        v3292 = nil;
                                    end;
                                end;
                                if l_pass_1 then
                                    local v3296;
                                    if not v3288 then
                                        v3296 = "empty return";
                                    else
                                        local l_t_2 = v3288.t;
                                        v3296 = if l_t_2 == "return" then #v3288.values == 0 and "empty return" or nil else l_t_2 == "break" and "break" or l_t_2 == "continue" and "continue" or nil;
                                    end;
                                    if v3296 then
                                        if #v3279.pass == 1 then
                                            return;
                                        else
                                            local v3298;
                                            if not v3292 then
                                                v3298 = "empty return";
                                            else
                                                local l_t_3 = v3292.t;
                                                v3298 = if l_t_3 == "return" then #v3292.values == 0 and "empty return" or nil else l_t_3 == "break" and "break" or l_t_3 == "continue" and "continue" or nil;
                                            end;
                                            if v3298 and v3296 == v3298 then
                                                local v3300 = {};
                                                local v3301 = v3285 + 1;
                                                if v3288 then
                                                    local l_remove_0 = table.remove;
                                                    local l_lines_3 = v3288.lines;
                                                    local v3304 = table.find(v3288.lines, v3288);
                                                    assert(v3304);
                                                    l_remove_0(l_lines_3, v3304);
                                                end;
                                                if v3292 then
                                                    local l_remove_1 = table.remove;
                                                    local l_lines_4 = v3292.lines;
                                                    local v3307 = table.find(v3292.lines, v3292);
                                                    assert(v3307);
                                                    l_remove_1(l_lines_4, v3307);
                                                end;
                                                while l_lines_2[v3301] do
                                                    local v3308 = l_lines_2[v3301];
                                                    assert(v3308);
                                                    local l_v3308_0 = v3308;
                                                    table.remove(l_lines_2, v3301);
                                                    if v3288 and l_v3308_0 == v3288 then
                                                        assert(not l_lines_2[v3301]);
                                                        break;
                                                    else
                                                        l_v3308_0.lines = v3300;
                                                        table.insert(v3300, l_v3308_0);
                                                    end;
                                                end;
                                                v3279.else_ = v3300;
                                                if v3296 ~= "empty return" then
                                                    if v3288 then
                                                        table.insert(l_lines_2, v3288);
                                                        return;
                                                    elseif v3292 then
                                                        table.insert(l_lines_2, v3292);
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end, 
            ["while"] = function(v3310)
                local v3311 = false;
                local v3312 = false;
                if not v3310.expr then
                    local v3313 = nil;
                    local v3314 = {};
                    local l_code_7 = v3310.code;
                    local v3316 = {};
                    for v3317 = #l_code_7, 1, -1 do
                        local v3318 = l_code_7[v3317];
                        local v3319;
                        if v3318.t == "if" and not v3318.else_ and #v3318.elseifs == 0 then
                            local l_pass_2 = v3318.pass;
                            if #l_pass_2 == 1 and l_pass_2[1].t == "break" then
                                v3319 = true;
                                v3311 = true;
                            end;
                        end;
                        if not v3311 then
                            v3319 = nil;
                        end;
                        v3311 = false;
                        if v3319 then
                            table.insert(v3316, v3318.expr);
                            l_code_7[v3317] = nil;
                        else
                            break;
                        end;
                    end;
                    for v3321 = #v3316, 1, -1 do
                        table.insert(v3314, v3316[v3321]);
                    end;
                    if #v3314 > 0 then
                        v3313 = true;
                    else
                        for _, v3323 in ipairs(l_code_7) do
                            local v3324;
                            if v3323.t == "if" and not v3323.else_ and #v3323.elseifs == 0 then
                                local l_pass_3 = v3323.pass;
                                if #l_pass_3 == 1 and l_pass_3[1].t == "break" then
                                    v3324 = true;
                                    v3312 = true;
                                end;
                            end;
                            if not v3312 then
                                v3324 = nil;
                            end;
                            v3312 = false;
                            if v3324 then
                                local l_expr_0 = v3323.expr;
                                local v3327;
                                if l_expr_0.t == "condition" then
                                    l_expr_0.condition = v215[l_expr_0.condition];
                                    v3327 = l_expr_0;
                                else
                                    v3327 = if l_expr_0.t == "not" then l_expr_0.rhs else v1301(l_expr_0);
                                end;
                                table.insert(v3314, v3327);
                            else
                                break;
                            end;
                        end;
                        for _ = 1, #v3314 do
                            table.remove(l_code_7, 1);
                        end;
                    end;
                    if #v3314 > 0 then
                        if #v3314 == 1 then
                            v3310.expr = v3314[1];
                        else
                            v3316 = v3314[1];
                            for v3329 = 2, #v3314 do
                                v3316 = v1309(v3316, v3314[v3329]);
                            end;
                            v3310.expr = v3316;
                        end;
                        if v3313 then
                            v3310.t = "repeat";
                        end;
                    end;
                end;
                if v3310.expr then
                    v3180(v3310.expr);
                end;
                v3179(v3310.code);
            end, 
            ["repeat"] = function(v3330)
                if v3330.expr then
                    v3180(v3330.expr);
                end;
                v3179(v3330.code);
            end, 
            ["do"] = function(v3331)
                v3179(v3331.content);
            end, 
            ["for"] = function(v3332)
                local l_for_info_1 = v3332.for_info;
                local l_variables_1 = l_for_info_1.variables;
                assert(l_variables_1);
                local l_type_8 = l_for_info_1.type;
                if l_type_8 == "numeric" then
                    assert(#l_variables_1 == 1);
                    if not v3261[v3332] then
                        v3261[v3332] = true;
                        local v3336 = l_variables_1[1];
                        local l_i_0 = v1213.i;
                        local v3338 = "i";
                        local v3339 = l_i_0 or 1;
                        while v1206[v3338] or v1141[v3338] do
                            v3339 = v3339 + 1;
                            v3338 = "i" .. "_" .. v3339;
                        end;
                        v1213.i = v3339;
                        local l_v3338_0 = v3338;
                        l_i_0 = v3336.name;
                        if not v1206[l_i_0] then
                            error((("[write] Variable %* not allocated"):format(l_i_0)));
                        end;
                        v1206[l_i_0] = nil;
                        v3336.name = l_v3338_0;
                        v1206[l_v3338_0] = v3336;
                        v3336.attributes.renamed = true;
                    end;
                    local l_args_3 = l_for_info_1.args;
                    local l_index_expr_0 = l_args_3.index_expr;
                    assert(l_index_expr_0);
                    v3180(l_index_expr_0);
                    local l_end_expr_0 = l_args_3.end_expr;
                    assert(l_end_expr_0);
                    v3180(l_end_expr_0);
                    local l_step_expr_0 = l_args_3.step_expr;
                    assert(l_step_expr_0);
                    v3180(l_step_expr_0);
                elseif l_type_8 == "generic" then
                    assert(#l_variables_1 > 0);
                    if not v3261[v3332] then
                        v3261[v3332] = true;
                        local v3345 = l_variables_1[1];
                        local l_i_1 = v1213.i;
                        local v3347 = "i";
                        local v3348 = l_i_1 or 1;
                        while v1206[v3347] or v1141[v3347] do
                            v3348 = v3348 + 1;
                            v3347 = "i" .. "_" .. v3348;
                        end;
                        v1213.i = v3348;
                        local l_v3347_0 = v3347;
                        l_i_1 = v3345.name;
                        if not v1206[l_i_1] then
                            error((("[write] Variable %* not allocated"):format(l_i_1)));
                        end;
                        v1206[l_i_1] = nil;
                        v3345.name = l_v3347_0;
                        v1206[l_v3347_0] = v3345;
                        v3345.attributes.renamed = true;
                        if #l_variables_1 == 2 then
                            v3345 = l_variables_1[2];
                            l_i_1 = v1213.v;
                            v3347 = "v";
                            v3348 = l_i_1 or 1;
                            while v1206[v3347] or v1141[v3347] do
                                v3348 = v3348 + 1;
                                v3347 = "v" .. "_" .. v3348;
                            end;
                            v1213.v = v3348;
                            l_v3347_0 = v3347;
                            l_i_1 = v3345.name;
                            if not v1206[l_i_1] then
                                error((("[write] Variable %* not allocated"):format(l_i_1)));
                            end;
                            v1206[l_i_1] = nil;
                            v3345.name = l_v3347_0;
                            v1206[l_v3347_0] = v3345;
                            v3345.attributes.renamed = true;
                        else
                            for v3350 = 2, #l_variables_1 do
                                v3347 = l_variables_1[v3350];
                                local v3351 = "v" .. v3350 - 1;
                                local v3352 = v1213[v3351];
                                local l_v3351_0 = v3351;
                                local v3354 = v3352 or 1;
                                while v1206[l_v3351_0] or v1141[l_v3351_0] do
                                    v3354 = v3354 + 1;
                                    l_v3351_0 = v3351 .. "_" .. v3354;
                                end;
                                v1213[v3351] = v3354;
                                v3348 = l_v3351_0;
                                v3351 = v3347.name;
                                if not v1206[v3351] then
                                    error((("[write] Variable %* not allocated"):format(v3351)));
                                end;
                                v1206[v3351] = nil;
                                v3347.name = v3348;
                                v1206[v3348] = v3347;
                                v3347.attributes.renamed = true;
                            end;
                        end;
                    end;
                    local l_args_4 = l_for_info_1.args;
                    local l_generator_expr_0 = l_args_4.generator_expr;
                    assert(l_generator_expr_0);
                    v3180(l_generator_expr_0);
                    if l_args_4.state_expr then
                        v3180(l_args_4.state_expr);
                    end;
                    if l_args_4.index_expr then
                        v3180(l_args_4.index_expr);
                    end;
                else
                    error((("Unknown for_type \"%*\""):format(l_type_8)));
                end;
                v3179(v3332.code);
            end
        };
        local v3399 = {
            {}, 
            {
                ["define variable"] = function(v3358)
                    local l_value_6 = v3358.value;
                    while l_value_6.t == "name" do
                        local l_override_expr_8 = l_value_6.name.override_expr;
                        if l_override_expr_8 then
                            l_value_6 = l_override_expr_8;
                        else
                            break;
                        end;
                    end;
                    local l_l_value_6_0 = l_value_6;
                    if l_l_value_6_0.t == "new table" then
                        v3251(v3358);
                    elseif l_l_value_6_0.t == "function" then
                        assert(#v3358.names == 1);
                        l_value_6 = v3358.names[1];
                        assert(l_value_6 == l_l_value_6_0.varname);
                        local l_name_9 = l_l_value_6_0.name;
                        local l_name_10 = l_value_6.name;
                        if not v1206[l_name_10] then
                            error((("[write] Variable %* not allocated"):format(l_name_10)));
                        end;
                        v1206[l_name_10] = nil;
                        l_value_6.name = l_name_9;
                        v1206[l_name_9] = l_value_6;
                        l_value_6.attributes.renamed = true;
                        v3233(v3358, l_l_value_6_0, l_value_6, "local");
                    end;
                    v3180(l_l_value_6_0);
                end, 
                ["set variable"] = function(v3364)
                    local l_value_7 = v3364.value;
                    while l_value_7.t == "name" do
                        local l_override_expr_9 = l_value_7.name.override_expr;
                        if l_override_expr_9 then
                            l_value_7 = l_override_expr_9;
                        else
                            break;
                        end;
                    end;
                    local l_l_value_7_0 = l_value_7;
                    if l_l_value_7_0.t == "function" then
                        l_value_7 = v3364.name;
                        local l_name_11 = l_l_value_7_0.name;
                        if v1129.smart_var_level >= 2 then
                            local l_name_12 = l_value_7.name;
                            if not v1206[l_name_12] then
                                error((("[write] Variable %* not allocated"):format(l_name_12)));
                            end;
                            v1206[l_name_12] = nil;
                            l_value_7.name = l_name_11;
                            v1206[l_name_11] = l_value_7;
                            l_value_7.attributes.renamed = true;
                        end;
                        v3233(v3364, l_l_value_7_0, l_value_7, "global");
                    end;
                    v3180(v3364.value);
                end, 
                ["set global"] = function(v3370)
                    local l_value_8 = v3370.value;
                    while l_value_8.t == "name" do
                        local l_override_expr_10 = l_value_8.name.override_expr;
                        if l_override_expr_10 then
                            l_value_8 = l_override_expr_10;
                        else
                            break;
                        end;
                    end;
                    local l_l_value_8_0 = l_value_8;
                    if l_l_value_8_0.t == "function" then
                        l_value_8 = v3370.name;
                        if l_value_8.type == 3 then
                            local l_v3233_0 = v3233;
                            local l_v3370_0 = v3370;
                            local l_l_l_value_8_0_0 = l_l_value_8_0;
                            local l_value_9 = l_value_8.value;
                            l_v3233_0(l_v3370_0, l_l_l_value_8_0_0, v1206[l_value_9] or v1223(l_value_9, {
                                beginning = -1, 
                                ending = -1
                            }, {}), "global");
                        end;
                    end;
                    v3180(l_l_value_8_0);
                end, 
                ["set table"] = function(v3378)
                    local l_value_10 = v3378.value;
                    while l_value_10.t == "name" do
                        local l_override_expr_11 = l_value_10.name.override_expr;
                        if l_override_expr_11 then
                            l_value_10 = l_override_expr_11;
                        else
                            break;
                        end;
                    end;
                    local l_l_value_10_0 = l_value_10;
                    if l_l_value_10_0.t == "function" then
                        local l_table_1 = v3378.table;
                        while l_table_1.t == "name" do
                            local l_override_expr_12 = l_table_1.name.override_expr;
                            if l_override_expr_12 then
                                l_table_1 = l_override_expr_12;
                            else
                                break;
                            end;
                        end;
                        l_value_10 = l_table_1;
                        l_table_1 = l_value_10.t;
                        local v3384 = nil;
                        if l_table_1 == "global" then
                            local l_name_13 = l_value_10.name;
                            if l_name_13.type == 3 then
                                v3384 = l_name_13.value;
                            end;
                        elseif l_table_1 == "name" then
                            v3384 = l_value_10.name.name;
                        end;
                        if v3384 and v538(v3384) then
                            local v3386 = nil;
                            local l_key_1 = v3378.key;
                            if l_key_1.t == "constant" then
                                local l_const_1 = l_key_1.const;
                                if l_const_1.type == 3 then
                                    local l_value_11 = l_const_1.value;
                                    if v538(l_value_11) then
                                        assert(type(l_value_11) == "string");
                                        v3386 = l_value_11;
                                    end;
                                end;
                            end;
                            if v3386 then
                                local l_v3233_1 = v3233;
                                local l_v3378_0 = v3378;
                                local l_l_l_value_10_0_0 = l_l_value_10_0;
                                local l_v3386_0 = v3386;
                                local v3394 = v1206[l_v3386_0] or v1223(l_v3386_0, {
                                    beginning = -1, 
                                    ending = -1
                                }, {});
                                l_v3386_0 = "table";
                                local v3395 = {};
                                local l_v3384_0 = v3384;
                                local v3397 = v1206[l_v3384_0] or v1223(l_v3384_0, {
                                    beginning = -1, 
                                    ending = -1
                                }, {});
                                local l_v3386_1 = v3386;
                                l_v3384_0 = v1206[l_v3386_1] or v1223(l_v3386_1, {
                                    beginning = -1, 
                                    ending = -1
                                }, {});
                                v6(v3395, 1, v3397, l_v3384_0);
                                l_v3233_1(l_v3378_0, l_l_l_value_10_0_0, v3394, l_v3386_0, v3395);
                            end;
                        end;
                        v3180(l_value_10);
                        v3180(v3378.key);
                        v3180(l_l_value_10_0);
                        return;
                    else
                        v3180(v3378.table);
                        v3180(v3378.key);
                        v3180(l_l_value_10_0);
                        return;
                    end;
                end
            }
        };
        assert(#v3399 > 0);
        local v3400 = nil;
        v3179 = function(v3401)
            local l_v1203_3 = v1203;
            local l_v3181_0 = v3181;
            v1203 = v3401;
            v3181 = 1;
            while true do
                if v3181 <= #v3401 then
                    local v3404 = v3401[v3181];
                    if v3188[v3404] then
                        return;
                    else
                        v3188[v3404] = true;
                        local v3405 = v3400[v3404.t];
                        if v3405 then
                            v3405(v3404);
                            v3181 = v3181 + 1;
                        else
                            print(v3404);
                            error((("Unknown line type %*"):format(v3404.t)));
                        end;
                    end;
                else
                    v1203 = l_v1203_3;
                    v3181 = l_v3181_0;
                    return;
                end;
            end;
        end;
        local function _()
            v3177 = 0;
        end;
        local function v3446()
            v3177 = 0;
            local v3407 = {};
            for _, v3409 in pairs(table.clone(v1206)) do
                if v3409.init_expr then
                    assert(v3409.init_expr);
                    local l_attributes_0 = v3409.attributes;
                    if not l_attributes_0.no_inline and not l_attributes_0.is_upvalue then
                        local v3411 = #v3409.reads;
                        if v3411 == 1 then
                            if #v3409.writes == 1 then
                                if l_attributes_0.multireg then
                                    local v3412 = v3409.reads[1];
                                    if not v3407[v3412] and v3412.t == "for" then
                                        v3407[v3412] = true;
                                        local l_var_list_1 = v3409.var_list;
                                        assert(#l_var_list_1 > 1);
                                        if #l_var_list_1 < 4 then
                                            local v3414 = v3409.writes[1];
                                            local l_init_expr_0 = v3409.init_expr;
                                            assert(l_init_expr_0);
                                            local v3416 = true;
                                            for _, v3418 in ipairs(l_var_list_1) do
                                                if v3418 ~= v3409 then
                                                    if not (#v3418.reads == 1 and #v3418.writes == 1) or v3418.reads[1] ~= v3412 then
                                                        v3416 = false;
                                                        break;
                                                    else
                                                        assert(v3418.writes[1] == v3414);
                                                        assert(v3418.init_expr == l_init_expr_0);
                                                    end;
                                                end;
                                            end;
                                            if v3416 then
                                                local l_for_info_2 = v3412.for_info;
                                                assert(l_for_info_2.type == "generic");
                                                local l_args_5 = l_for_info_2.args;
                                                local l_generator_expr_1 = l_args_5.generator_expr;
                                                local l_state_expr_0 = l_args_5.state_expr;
                                                local l_index_expr_1 = l_args_5.index_expr;
                                                for v3424, v3425 in ipairs(l_var_list_1) do
                                                    assert(v3425.var_num == v3424);
                                                end;
                                                v3416 = false;
                                                if #l_var_list_1 == 2 then
                                                    if l_state_expr_0 then
                                                        local l_l_state_expr_0_0 = l_state_expr_0;
                                                        local v3427 = l_var_list_1[1];
                                                        local l_l_l_state_expr_0_0_0 = l_l_state_expr_0_0;
                                                        while l_l_l_state_expr_0_0_0.t == "name" do
                                                            local l_override_expr_13 = l_l_l_state_expr_0_0_0.name.override_expr;
                                                            if l_override_expr_13 then
                                                                l_l_l_state_expr_0_0_0 = l_override_expr_13;
                                                            else
                                                                break;
                                                            end;
                                                        end;
                                                        l_l_state_expr_0_0 = l_l_l_state_expr_0_0_0;
                                                        if l_l_state_expr_0_0.t == "name" and l_l_state_expr_0_0.name == v3427 and l_index_expr_1 then
                                                            l_l_state_expr_0_0 = l_index_expr_1;
                                                            v3427 = l_var_list_1[2];
                                                            l_l_l_state_expr_0_0_0 = l_l_state_expr_0_0;
                                                            while l_l_l_state_expr_0_0_0.t == "name" do
                                                                local l_override_expr_14 = l_l_l_state_expr_0_0_0.name.override_expr;
                                                                if l_override_expr_14 then
                                                                    l_l_l_state_expr_0_0_0 = l_override_expr_14;
                                                                else
                                                                    break;
                                                                end;
                                                            end;
                                                            l_l_state_expr_0_0 = l_l_l_state_expr_0_0_0;
                                                            if l_l_state_expr_0_0.t == "name" and l_l_state_expr_0_0.name == v3427 then
                                                                v3416 = true;
                                                                l_args_5.state_expr = l_init_expr_0;
                                                                l_args_5.index_expr = nil;
                                                            end;
                                                        end;
                                                    end;
                                                elseif l_generator_expr_1 then
                                                    local l_l_generator_expr_1_0 = l_generator_expr_1;
                                                    local v3432 = l_var_list_1[1];
                                                    local l_l_l_generator_expr_1_0_0 = l_l_generator_expr_1_0;
                                                    while l_l_l_generator_expr_1_0_0.t == "name" do
                                                        local l_override_expr_15 = l_l_l_generator_expr_1_0_0.name.override_expr;
                                                        if l_override_expr_15 then
                                                            l_l_l_generator_expr_1_0_0 = l_override_expr_15;
                                                        else
                                                            break;
                                                        end;
                                                    end;
                                                    l_l_generator_expr_1_0 = l_l_l_generator_expr_1_0_0;
                                                    if l_l_generator_expr_1_0.t == "name" and l_l_generator_expr_1_0.name == v3432 and l_state_expr_0 then
                                                        l_l_generator_expr_1_0 = l_state_expr_0;
                                                        v3432 = l_var_list_1[2];
                                                        l_l_l_generator_expr_1_0_0 = l_l_generator_expr_1_0;
                                                        while l_l_l_generator_expr_1_0_0.t == "name" do
                                                            local l_override_expr_16 = l_l_l_generator_expr_1_0_0.name.override_expr;
                                                            if l_override_expr_16 then
                                                                l_l_l_generator_expr_1_0_0 = l_override_expr_16;
                                                            else
                                                                break;
                                                            end;
                                                        end;
                                                        l_l_generator_expr_1_0 = l_l_l_generator_expr_1_0_0;
                                                        if l_l_generator_expr_1_0.t == "name" and l_l_generator_expr_1_0.name == v3432 and l_index_expr_1 then
                                                            l_l_generator_expr_1_0 = l_index_expr_1;
                                                            v3432 = l_var_list_1[3];
                                                            l_l_l_generator_expr_1_0_0 = l_l_generator_expr_1_0;
                                                            while l_l_l_generator_expr_1_0_0.t == "name" do
                                                                local l_override_expr_17 = l_l_l_generator_expr_1_0_0.name.override_expr;
                                                                if l_override_expr_17 then
                                                                    l_l_l_generator_expr_1_0_0 = l_override_expr_17;
                                                                else
                                                                    break;
                                                                end;
                                                            end;
                                                            l_l_generator_expr_1_0 = l_l_l_generator_expr_1_0_0;
                                                            if l_l_generator_expr_1_0.t == "name" and l_l_generator_expr_1_0.name == v3432 then
                                                                v3416 = true;
                                                                l_args_5.generator_expr = l_init_expr_0;
                                                                l_args_5.state_expr = nil;
                                                                l_args_5.index_expr = nil;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                                if v3416 then
                                                    local l_lines_5 = v3414.lines;
                                                    local v3438 = table.find(l_lines_5, v3414);
                                                    assert(v3438);
                                                    v1175(v3412, v3409);
                                                    v1180(v3414, v3409);
                                                    table.remove(l_lines_5, v3438);
                                                    assert(v3409.init_expr);
                                                    v3177 = v3177 + 1;
                                                end;
                                            end;
                                        end;
                                    end;
                                else
                                    local v3439 = v3409.reads[1];
                                    local v3440 = v3409.writes[1];
                                    if not v218[v3440.t] then
                                        local l_lines_6 = v3440.lines;
                                        local v3442 = table.find(l_lines_6, v3440);
                                        assert(v3442);
                                        v1175(v3439, v3409);
                                        v1180(v3440, v3409);
                                        table.remove(l_lines_6, v3442);
                                        local l_init_expr_1 = v3409.init_expr;
                                        local l_name_14 = v3409.name;
                                        if not v1206[l_name_14] then
                                            error((("[write] Variable %* not allocated"):format(l_name_14)));
                                        end;
                                        v1206[l_name_14] = nil;
                                        v3409.override_expr = l_init_expr_1;
                                        v3177 = v3177 + 1;
                                    end;
                                end;
                            end;
                        elseif v3411 == 0 and not l_attributes_0._ then
                            local l_name_15 = v3409.name;
                            if not v1206[l_name_15] then
                                error((("[write] Variable %* not allocated"):format(l_name_15)));
                            end;
                            v1206[l_name_15] = nil;
                            v3409.name = "_";
                            v1206._ = v3409;
                            v3409.attributes.renamed = true;
                            l_attributes_0._ = true;
                            v3177 = v3177 + 1;
                        end;
                    end;
                end;
            end;
        end;
        local function v3451()
            v3177 = 0;
            v3400 = table.clone(v3357);
            for _, v3448 in ipairs(v3399) do
                for v3449, v3450 in pairs(v3448) do
                    v3400[v3449] = v3450;
                end;
                while true do
                    v3188 = {};
                    v3179(v1203);
                    if v3177 ~= 0 then
                        v3177 = 0;
                    else
                        break;
                    end;
                end;
                v3177 = 0;
            end;
        end;
        local function _()
            local v3452 = -1;
            while true do
                v3452 = v3452 + 1;
                v3446();
                if not (v3177 ~= 0) then
                    break;
                end;
            end;
            return v3452;
        end;
        local function _()
            local v3454 = -1;
            while true do
                v3454 = v3454 + 1;
                v3451();
                if not (v3177 ~= 0) then
                    break;
                end;
            end;
            return v3454;
        end;
        local v3456 = nil;
        while true do
            v3456 = 0;
            local v3457 = -1;
            while true do
                v3457 = v3457 + 1;
                v3451();
                if not (v3177 ~= 0) then
                    break;
                end;
            end;
            v3456 = v3456 + v3457;
            v3457 = -1;
            while true do
                v3457 = v3457 + 1;
                v3446();
                if not (v3177 ~= 0) then
                    break;
                end;
            end;
            if not (v3456 + v3457 ~= 0) then
                break;
            end;
        end;
        v1128:end_benchmark("Global High Level Reductions");
        v1128:start_benchmark("Smart Naming");
        local v3458 = v1129.smart_var_level >= 3 and "NONE" or nil;
        local v3459 = v1129.smart_var_extensive_prefixes and true or nil;
        local function _(v3460)
            if v3459 then
                return v3460;
            else
                return "";
            end;
        end;
        local function _(v3462)
            local l_reads_1 = v3462.reads;
            local v3464 = l_reads_1[#l_reads_1];
            if v3464 and v3464.t == "return" then
                local v3465 = {};
                local l_values_0 = v3464.values;
                if v1129.smart_var_level == 3 then
                    return true;
                elseif #v3465 == 1 then
                    v3465 = l_values_0;
                    return;
                else
                    return;
                end;
            else
                return;
            end;
        end;
        local function v3473(v3468)
            local v3469 = true;
            if v3468.t ~= "constant index" then
                v3469 = v3468.t == "get table";
            end;
            assert(v3469);
            local v3470 = "";
            v3469 = nil;
            local v3471, v3472;
            while true do
                if v3468.t == "constant index" then
                    v3470 = "." .. v3468.index.value .. v3470;
                elseif v3468.t == "get table" then
                    v3472 = v3468.index;
                    if v3472.t == "constant" then
                        v3470 = "." .. v550(v3472.const, v1129.string_quotes_behavior, true) .. v3470;
                    else
                        v3470 = ".any" .. v3470;
                    end;
                else
                    assert(nil);
                end;
                v3472 = v3468.table;
                v3471 = v3472.t;
                if not (v3471 ~= "constant index") or v3471.t == "get table" then
                    v3468 = v3472;
                else
                    break;
                end;
            end;
            if v3471 == "global" then
                return v550(v3472.name, v1129.string_quotes_behavior, true) .. v3470, v3469;
            else
                return "any" .. v3470, true;
            end;
        end;
        local _ = function(v3474)
            local _ = nil;
            local v3476 = string.reverse(v3474);
            local v3477 = string.find(v3476, "%.");
            if v3477 then
                return (string.sub(v3474, #v3474 - v3477 + 2, #v3474));
            else
                return v3474;
            end;
        end;
        local v3543 = {
            GetMouse = function(v3479, _)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_1 = v3479.var_num;
                    assert(l_var_num_1);
                    if l_var_num_1 > 1 then
                        return v3458;
                    end;
                end;
                return "mouse";
            end, 
            Clone = function(v3482, _)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_2 = v3482.var_num;
                    assert(l_var_num_2);
                    if l_var_num_2 > 1 then
                        return v3458;
                    end;
                end;
                return "clone";
            end, 
            GetChildren = function(v3485, _)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_3 = v3485.var_num;
                    assert(l_var_num_3);
                    if l_var_num_3 > 1 then
                        return v3458;
                    end;
                end;
                return "children";
            end, 
            GetDescendants = function(v3488, _)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_4 = v3488.var_num;
                    assert(l_var_num_4);
                    if l_var_num_4 > 1 then
                        return v3458;
                    end;
                end;
                return "descendants";
            end, 
            GetPlayers = function(v3491, _)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_5 = v3491.var_num;
                    assert(l_var_num_5);
                    if l_var_num_5 > 1 then
                        return v3458;
                    end;
                end;
                return "players";
            end, 
            format = function(v3494, v3495)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_6 = v3494.var_num;
                    assert(l_var_num_6);
                    if l_var_num_6 > 1 then
                        return v3458;
                    end;
                end;
                if v3459 then
                    local v3497 = #v3495.args;
                    if v3497 == 1 then
                        return "formatted_1_value";
                    else
                        return "formatted_" .. v3497 .. "_values";
                    end;
                else
                    return "formatted";
                end;
            end, 
            IsA = function(v3498, _)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_7 = v3498.var_num;
                    assert(l_var_num_7);
                    if l_var_num_7 > 1 then
                        return v3458;
                    end;
                end;
                return "children";
            end, 
            WaitForChild = function(v3501, v3502)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_8 = v3501.var_num;
                    assert(l_var_num_8);
                    if l_var_num_8 > 1 then
                        return v3458;
                    end;
                end;
                local l_args_6 = v3502.args;
                if v1129.smart_var_level >= 3 and #l_args_6 == 0 then
                    return (v3459 and "instance_" or "") .. "NEVER";
                else
                    local v3505 = nil;
                    local v3506 = l_args_6[1];
                    if v3506.t == "constant" and v1129.smart_var_level >= 2 then
                        local l_const_2 = v3506.const;
                        if l_const_2.type == 3 then
                            return (v3459 and "instance_" or "") .. v545(l_const_2.value, true, true);
                        elseif v1129.smart_var_level >= 3 then
                            v3505 = true;
                        end;
                    end;
                    if v3505 then
                        return (v3459 and "instance_" or "") .. "NEVER";
                    elseif v1129.smart_var_level >= 3 then
                        return (v3459 and "instance_" or "") .. "SOME";
                    elseif v1129.smart_var_level >= 2 then
                        return "instance";
                    else
                        return;
                    end;
                end;
            end, 
            FindFirstChildOfClass = function(v3508, v3509)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_9 = v3508.var_num;
                    assert(l_var_num_9);
                    if l_var_num_9 > 1 then
                        return v3458;
                    end;
                end;
                local l_args_7 = v3509.args;
                if v1129.smart_var_level >= 3 and #l_args_7 == 0 then
                    return (v3459 and "instance_" or "") .. "NEVER";
                else
                    local v3512 = nil;
                    local v3513 = l_args_7[1];
                    if v3513.t == "constant" and v1129.smart_var_level >= 2 then
                        local l_const_3 = v3513.const;
                        if l_const_3.type == 3 then
                            return (v3459 and "instance_with_" or "") .. "class_" .. v545(l_const_3.value, true, true);
                        elseif v1129.smart_var_level >= 3 then
                            v3512 = true;
                        end;
                    end;
                    if v3512 then
                        return (v3459 and "instance_" or "") .. "NEVER";
                    elseif v1129.smart_var_level >= 2 then
                        return "instance";
                    else
                        return;
                    end;
                end;
            end, 
            FindFirstChildWhichIsA = function(v3515, v3516)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_10 = v3515.var_num;
                    assert(l_var_num_10);
                    if l_var_num_10 > 1 then
                        return v3458;
                    end;
                end;
                local l_args_8 = v3516.args;
                if v1129.smart_var_level >= 3 and #l_args_8 == 0 then
                    return (v3459 and "instance_" or "") .. "NEVER";
                else
                    local v3519 = nil;
                    local v3520 = l_args_8[1];
                    if v3520.t == "constant" and v1129.smart_var_level >= 2 then
                        local l_const_4 = v3520.const;
                        if l_const_4.type == 3 then
                            return (v3459 and "instance_which_is_a_" or "") .. "class_" .. v545(l_const_4.value, true, true);
                        elseif v1129.smart_var_level >= 3 then
                            v3519 = true;
                        end;
                    end;
                    if v3519 then
                        return (v3459 and "instance_" or "") .. "NEVER";
                    elseif v1129.smart_var_level >= 2 then
                        return "instance";
                    else
                        return;
                    end;
                end;
            end, 
            GetAttribute = function(v3522, v3523)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_11 = v3522.var_num;
                    assert(l_var_num_11);
                    if l_var_num_11 > 1 then
                        return v3458;
                    end;
                end;
                local l_args_9 = v3523.args;
                if v1129.smart_var_level >= 3 and #l_args_9 == 0 then
                    return "NEVER";
                else
                    local v3526 = nil;
                    local v3527 = l_args_9[1];
                    if v3527.t == "constant" and v1129.smart_var_level >= 2 then
                        local l_const_5 = v3527.const;
                        if l_const_5.type == 3 then
                            return (v3459 and "attribute_" or "") .. v545(l_const_5.value, true, true);
                        elseif v1129.smart_var_level >= 3 then
                            v3526 = true;
                        end;
                    end;
                    if v3526 then
                        return "NEVER";
                    elseif v1129.smart_var_level >= 2 then
                        return "attribute";
                    else
                        return;
                    end;
                end;
            end, 
            GetAttributeChangedSignal = function(v3529, v3530)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_12 = v3529.var_num;
                    assert(l_var_num_12);
                    if l_var_num_12 > 1 then
                        return v3458;
                    end;
                end;
                local l_args_10 = v3530.args;
                if v1129.smart_var_level >= 3 and #l_args_10 == 0 then
                    return "NEVER";
                else
                    local v3533 = nil;
                    local v3534 = l_args_10[1];
                    if v3534.t == "constant" and v1129.smart_var_level >= 2 then
                        local l_const_6 = v3534.const;
                        if l_const_6.type == 3 then
                            return (v3459 and "attribute_" or "") .. v545(l_const_6.value, true, true) .. "_changed_signal";
                        elseif v1129.smart_var_level >= 3 then
                            v3533 = true;
                        end;
                    end;
                    if v3533 then
                        return "NEVER";
                    elseif v1129.smart_var_level >= 2 then
                        return "attribute_changed_signal";
                    else
                        return;
                    end;
                end;
            end, 
            GetPropertyChangedSignal = function(v3536, v3537)
                if v1129.smart_var_level >= 3 then
                    local l_var_num_13 = v3536.var_num;
                    assert(l_var_num_13);
                    if l_var_num_13 > 1 then
                        return v3458;
                    end;
                end;
                local l_args_11 = v3537.args;
                if v1129.smart_var_level >= 3 and #l_args_11 == 0 then
                    return "NEVER";
                else
                    local v3540 = nil;
                    local v3541 = l_args_11[1];
                    if v3541.t == "constant" and v1129.smart_var_level >= 2 then
                        local l_const_7 = v3541.const;
                        if l_const_7.type == 3 then
                            return (v3459 and "property_" or "") .. v545(l_const_7.value, true, true) .. "_changed_signal";
                        elseif v1129.smart_var_level >= 3 then
                            v3540 = true;
                        end;
                    end;
                    if v3540 then
                        return "NEVER";
                    elseif v1129.smart_var_level >= 2 then
                        return "property_changed_signal";
                    else
                        return;
                    end;
                end;
            end
        };
        local function _(v3544, v3545)
            local v3546 = v3543[v3545];
            assert(v3546);
            v3543[v3544] = v3546;
        end;
        local l_Clone_0 = v3543.Clone;
        assert(l_Clone_0);
        v3543.clone = l_Clone_0;
        l_Clone_0 = v3543.GetChildren;
        assert(l_Clone_0);
        v3543.getChildren = l_Clone_0;
        l_Clone_0 = v3543.GetChildren;
        assert(l_Clone_0);
        v3543.children = l_Clone_0;
        l_Clone_0 = v3543.WaitForChild;
        assert(l_Clone_0);
        v3543.FindFirstChild = l_Clone_0;
        l_Clone_0 = v3543.FindFirstChild;
        assert(l_Clone_0);
        v3543.findFirstChild = l_Clone_0;
        l_Clone_0 = v3543.FindFirstChild;
        assert(l_Clone_0);
        v3543.FindFirstAncestor = l_Clone_0;
        l_Clone_0 = v3543.FindFirstChildOfClass;
        assert(l_Clone_0);
        v3543.FindFirstAncestorOfClass = l_Clone_0;
        l_Clone_0 = v3543.FindFirstChildWhichIsA;
        assert(l_Clone_0);
        v3543.FindFirstAncestorWhichIsA = l_Clone_0;
        l_Clone_0 = v3543.FindFirstChild;
        assert(l_Clone_0);
        v3543.FindFirstDescendant = l_Clone_0;
        l_Clone_0 = {
            ["Instance.new"] = function(v3549, v3550)
                local l_var_num_14 = v3549.var_num;
                assert(l_var_num_14);
                if l_var_num_14 > 1 then
                    return v3458;
                else
                    local l_args_12 = v3550.args;
                    if #l_args_12 == 0 then
                        return (v3459 and "instance_" or "") .. "NEVER";
                    else
                        l_var_num_14 = nil;
                        if #l_args_12 > 1 and v1129.smart_var_level >= 2 and l_args_12[2].t ~= "nil" then
                            l_var_num_14 = true;
                        end;
                        local v3553 = nil;
                        local v3554 = l_args_12[1];
                        if v3554.t == "constant" then
                            local v3555 = v550(v3554.const, v1129.string_quotes_behavior, true);
                            v3553 = v545(v3555, true, true);
                        else
                            v3553 = "any";
                        end;
                        if l_var_num_14 then
                            return (v3459 and "instance_" or "") .. v3553 .. (v3459 and "_parented" or "");
                        else
                            return (v3459 and "instance_" or "") .. v3553;
                        end;
                    end;
                end;
            end, 
            ["math.random"] = function(v3556, v3557)
                local l_var_num_15 = v3556.var_num;
                assert(l_var_num_15);
                if l_var_num_15 > 1 then
                    return v3458;
                else
                    local v3559 = #v3557.args;
                    if v3559 == 0 and v1129.smart_var_level >= 2 then
                        return "seed";
                    elseif v1129.smart_var_level >= 3 then
                        if v3559 == 1 then
                            return "randint_from_1";
                        else
                            return "randint";
                        end;
                    else
                        return "randint";
                    end;
                end;
            end, 
            ["math.sqrt"] = function(v3560, v3561)
                local l_var_num_16 = v3560.var_num;
                assert(l_var_num_16);
                if l_var_num_16 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3561.args == 0 then
                        return "NEVER";
                    else
                        return "squareroot";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "root";
                else
                    return "num";
                end;
            end, 
            ["math.abs"] = function(v3563, v3564)
                local l_var_num_17 = v3563.var_num;
                assert(l_var_num_17);
                if l_var_num_17 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3564.args == 0 then
                        return "NEVER";
                    else
                        return "absolute";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "absolute";
                else
                    return "num";
                end;
            end, 
            ["math.floor"] = function(v3566, v3567)
                local l_var_num_18 = v3566.var_num;
                assert(l_var_num_18);
                if l_var_num_18 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    local v3569 = v3567.args[1];
                    if v3569 then
                        if v3569.t == "addition" then
                            l_var_num_18 = {
                                v3569.lhs, 
                                v3569.rhs
                            };
                            local v3570 = 0;
                            for _, v3572 in ipairs(l_var_num_18) do
                                if v3572.t == "constant" then
                                    local l_const_8 = v3572.const;
                                    if l_const_8.type == 2 and l_const_8.value == 0.5 then
                                        v3570 = v3570 + 1;
                                    end;
                                end;
                            end;
                            if v3570 == 2 then
                                return "one";
                            elseif v3570 == 1 then
                                return "rounded";
                            else
                                return "floored";
                            end;
                        else
                            return "floored";
                        end;
                    else
                        return "NEVER";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "floored";
                else
                    return "num";
                end;
            end, 
            ["math.ceil"] = function(v3574, v3575)
                local l_var_num_19 = v3574.var_num;
                assert(l_var_num_19);
                if l_var_num_19 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3575.args == 0 then
                        return "NEVER";
                    else
                        return "ceiled";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "ceiled";
                else
                    return "num";
                end;
            end, 
            ["math.round"] = function(v3577, v3578)
                local l_var_num_20 = v3577.var_num;
                assert(l_var_num_20);
                if l_var_num_20 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3578.args == 0 then
                        return "NEVER";
                    else
                        return "rounded";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "rounded";
                else
                    return "num";
                end;
            end, 
            ["math.sin"] = function(v3580, v3581)
                local l_var_num_21 = v3580.var_num;
                assert(l_var_num_21);
                if l_var_num_21 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3581.args == 0 then
                        return "NEVER";
                    else
                        return "sine";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "sine";
                else
                    return "num";
                end;
            end, 
            ["math.sinh"] = function(v3583, v3584)
                local l_var_num_22 = v3583.var_num;
                assert(l_var_num_22);
                if l_var_num_22 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3584.args == 0 then
                        return "NEVER";
                    else
                        return "hypsine";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "hypsine";
                else
                    return "num";
                end;
            end, 
            ["math.asin"] = function(v3586, v3587)
                local l_var_num_23 = v3586.var_num;
                assert(l_var_num_23);
                if l_var_num_23 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3587.args == 0 then
                        return "NEVER";
                    else
                        return "arcsine";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "arcsine";
                else
                    return "num";
                end;
            end, 
            ["math.cos"] = function(v3589, v3590)
                local l_var_num_24 = v3589.var_num;
                assert(l_var_num_24);
                if l_var_num_24 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3590.args == 0 then
                        return "NEVER";
                    else
                        return "cosine";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "cosine";
                else
                    return "num";
                end;
            end, 
            ["math.cosh"] = function(v3592, v3593)
                local l_var_num_25 = v3592.var_num;
                assert(l_var_num_25);
                if l_var_num_25 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3593.args == 0 then
                        return "NEVER";
                    else
                        return "hypcosine";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "hypcosine";
                else
                    return "num";
                end;
            end, 
            ["math.acos"] = function(v3595, v3596)
                local l_var_num_26 = v3595.var_num;
                assert(l_var_num_26);
                if l_var_num_26 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3596.args == 0 then
                        return "NEVER";
                    else
                        return "arccosine";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "arccosine";
                else
                    return "num";
                end;
            end, 
            ["math.tan"] = function(v3598, v3599)
                local l_var_num_27 = v3598.var_num;
                assert(l_var_num_27);
                if l_var_num_27 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3599.args == 0 then
                        return "NEVER";
                    else
                        return "tangent";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "tangent";
                else
                    return "num";
                end;
            end, 
            ["math.tanh"] = function(v3601, v3602)
                local l_var_num_28 = v3601.var_num;
                assert(l_var_num_28);
                if l_var_num_28 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3602.args == 0 then
                        return "NEVER";
                    else
                        return "hyptangent";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "hyptangent";
                else
                    return "num";
                end;
            end, 
            ["math.atan"] = function(v3604, v3605)
                local l_var_num_29 = v3604.var_num;
                assert(l_var_num_29);
                if l_var_num_29 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3605.args == 0 then
                        return "NEVER";
                    else
                        return "arctangent";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "arctangent";
                else
                    return "num";
                end;
            end, 
            ["math.atan2"] = function(v3607, v3608)
                local l_var_num_30 = v3607.var_num;
                assert(l_var_num_30);
                if l_var_num_30 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3608.args < 2 then
                        return "NEVER";
                    else
                        return "arctangent";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "arctangent";
                else
                    return "num";
                end;
            end, 
            ["math.rad"] = function(v3610, v3611)
                local l_var_num_31 = v3610.var_num;
                assert(l_var_num_31);
                if l_var_num_31 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3611.args == 0 then
                        return "NEVER";
                    else
                        return "radians";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "radians";
                else
                    return "num";
                end;
            end, 
            ["math.deg"] = function(v3613, v3614)
                local l_var_num_32 = v3613.var_num;
                assert(l_var_num_32);
                if l_var_num_32 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3614.args == 0 then
                        return "NEVER";
                    else
                        return "degrees";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "degrees";
                else
                    return "num";
                end;
            end, 
            ["math.sign"] = function(v3616, v3617)
                local l_var_num_33 = v3616.var_num;
                assert(l_var_num_33);
                if l_var_num_33 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3617.args == 0 then
                        return "NEVER";
                    else
                        return "sign";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "sign";
                else
                    return "num";
                end;
            end, 
            ["math.exp"] = function(v3619, v3620)
                local l_var_num_34 = v3619.var_num;
                assert(l_var_num_34);
                if l_var_num_34 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3620.args == 0 then
                        return "NEVER";
                    else
                        return "exponentiated";
                    end;
                else
                    return "num";
                end;
            end, 
            ["math.clamp"] = function(v3622, v3623)
                local l_var_num_35 = v3622.var_num;
                assert(l_var_num_35);
                if l_var_num_35 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3623.args < 3 then
                        return "NEVER";
                    else
                        return "clamped";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "clamped";
                else
                    return "num";
                end;
            end, 
            ["math.min"] = function(v3625, v3626)
                local l_var_num_36 = v3625.var_num;
                assert(l_var_num_36);
                if l_var_num_36 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3626.args == 0 then
                        return "NEVER";
                    else
                        return "minimum";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "minimum";
                else
                    return "num";
                end;
            end, 
            ["math.max"] = function(v3628, v3629)
                local l_var_num_37 = v3628.var_num;
                assert(l_var_num_37);
                if l_var_num_37 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3629.args == 0 then
                        return "NEVER";
                    else
                        return "maximum";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "maximum";
                else
                    return "num";
                end;
            end, 
            ["Random.new"] = function(v3631, _)
                local l_var_num_38 = v3631.var_num;
                assert(l_var_num_38);
                if l_var_num_38 > 1 then
                    return v3458;
                else
                    return "random_state";
                end;
            end, 
            ["bit32.lshift"] = function(v3634, v3635)
                local l_var_num_39 = v3634.var_num;
                assert(l_var_num_39);
                if l_var_num_39 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3635.args < 2 then
                        return "NEVER";
                    else
                        return "lshifted";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "shifted";
                else
                    return "num";
                end;
            end, 
            ["bit32.rshift"] = function(v3637, v3638)
                local l_var_num_40 = v3637.var_num;
                assert(l_var_num_40);
                if l_var_num_40 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3638.args < 2 then
                        return "NEVER";
                    else
                        return "rshifted";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "shifted";
                else
                    return "num";
                end;
            end, 
            ["bit32.arshift"] = function(v3640, v3641)
                local l_var_num_41 = v3640.var_num;
                assert(l_var_num_41);
                if l_var_num_41 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3641.args < 2 then
                        return "NEVER";
                    else
                        return "arshifted";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "shifted";
                else
                    return "num";
                end;
            end, 
            ["bit32.lrotate"] = function(v3643, v3644)
                local l_var_num_42 = v3643.var_num;
                assert(l_var_num_42);
                if l_var_num_42 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3644.args < 2 then
                        return "NEVER";
                    else
                        return "lrotated";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "rotated";
                else
                    return "num";
                end;
            end, 
            ["bit32.rrotate"] = function(v3646, v3647)
                local l_var_num_43 = v3646.var_num;
                assert(l_var_num_43);
                if l_var_num_43 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3647.args < 2 then
                        return "NEVER";
                    else
                        return "rrotated";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "rotated";
                else
                    return "num";
                end;
            end, 
            ["bit32.band"] = function(v3649, v3650)
                local l_var_num_44 = v3649.var_num;
                assert(l_var_num_44);
                if l_var_num_44 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3650.args == 0 then
                        return "bit32_max";
                    else
                        return "masked";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "masked";
                else
                    return "num";
                end;
            end, 
            ["bit32.bor"] = function(v3652, v3653)
                local l_var_num_45 = v3652.var_num;
                assert(l_var_num_45);
                if l_var_num_45 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3653.args == 0 then
                        return "zero";
                    else
                        return "flags";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "flags";
                else
                    return "num";
                end;
            end, 
            ["bit32.bxor"] = function(v3655, v3656)
                local l_var_num_46 = v3655.var_num;
                assert(l_var_num_46);
                if l_var_num_46 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3656.args == 0 then
                        return "zero";
                    else
                        return "xored";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "xored";
                else
                    return "num";
                end;
            end, 
            ["bit32.bnot"] = function(v3658, v3659)
                local l_var_num_47 = v3658.var_num;
                assert(l_var_num_47);
                if l_var_num_47 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3659.args == 0 then
                        return "NEVER";
                    else
                        return "inverted";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "inverted";
                else
                    return "num";
                end;
            end, 
            ["bit32.btest"] = function(v3661, v3662)
                local l_var_num_48 = v3661.var_num;
                assert(l_var_num_48);
                if l_var_num_48 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3662.args == 0 then
                        return "true_";
                    else
                        return "found_common_bit";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "found_common_bit";
                else
                    return "num";
                end;
            end, 
            ["bit32.countlz"] = function(v3664, v3665)
                local l_var_num_49 = v3664.var_num;
                assert(l_var_num_49);
                if l_var_num_49 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3665.args == 0 then
                        return "NEVER";
                    else
                        return "zero_count_left";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "zero_count";
                else
                    return "num";
                end;
            end, 
            ["bit32.countrz"] = function(v3667, v3668)
                local l_var_num_50 = v3667.var_num;
                assert(l_var_num_50);
                if l_var_num_50 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3668.args == 0 then
                        return "NEVER";
                    else
                        return "zero_count_right";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "zero_count";
                else
                    return "num";
                end;
            end, 
            ["bit32.extract"] = function(v3670, v3671)
                local l_var_num_51 = v3670.var_num;
                assert(l_var_num_51);
                if l_var_num_51 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3671.args < 2 then
                        return "NEVER";
                    else
                        return "extracted";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "extracted";
                else
                    return "num";
                end;
            end, 
            ["bit32.replace"] = function(v3673, v3674)
                local l_var_num_52 = v3673.var_num;
                assert(l_var_num_52);
                if l_var_num_52 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3674.args < 3 then
                        return "NEVER";
                    else
                        return "replaced";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "replaced";
                else
                    return "num";
                end;
            end, 
            ["debug.traceback"] = function(v3676, _)
                local l_var_num_53 = v3676.var_num;
                assert(l_var_num_53);
                if l_var_num_53 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 2 then
                    return "call_stack";
                else
                    return "num";
                end;
            end, 
            ["debug.info"] = function(v3679, v3680)
                if v1129.smart_var_level >= 2 then
                    if #v3680.args < 2 then
                        return "NEVER";
                    else
                        local v3681 = if #v3680.args == 2 then v3680.args[2] else v3680.args[3];
                        if v3681.t == "constant" then
                            local l_const_9 = v3681.const;
                            if l_const_9.type == 3 then
                                local l_value_12 = l_const_9.value;
                                if l_value_12 == "s" then
                                    local l_var_num_54 = v3679.var_num;
                                    assert(l_var_num_54);
                                    if l_var_num_54 == 1 then
                                        return "func_source";
                                    end;
                                elseif l_value_12 == "l" then
                                    local l_var_num_55 = v3679.var_num;
                                    assert(l_var_num_55);
                                    if l_var_num_55 == 1 then
                                        return "line_defined";
                                    end;
                                elseif l_value_12 == "n" then
                                    local l_var_num_56 = v3679.var_num;
                                    assert(l_var_num_56);
                                    if l_var_num_56 == 1 then
                                        return "func_name";
                                    end;
                                elseif l_value_12 == "a" then
                                    local l_var_num_57 = v3679.var_num;
                                    assert(l_var_num_57);
                                    local l_l_var_num_57_0 = l_var_num_57;
                                    if l_l_var_num_57_0 == 1 then
                                        return "parameter_count";
                                    elseif l_l_var_num_57_0 == 2 then
                                        return "is_vararg";
                                    else
                                        return v3458;
                                    end;
                                elseif l_value_12 == "f" then
                                    local l_var_num_58 = v3679.var_num;
                                    assert(l_var_num_58);
                                    if l_var_num_58 == 1 then
                                        return "func";
                                    end;
                                end;
                            end;
                            return "NEVER";
                        else
                            local l_var_num_59 = v3679.var_num;
                            assert(l_var_num_59);
                            if l_var_num_59 == 1 then
                                return "info";
                            end;
                        end;
                    end;
                else
                    local l_var_num_60 = v3679.var_num;
                    assert(l_var_num_60);
                    if l_var_num_60 == 1 then
                        return "num";
                    end;
                end;
                return v3458;
            end, 
            ["Vector3.new"] = function(v3692, v3693)
                local l_var_num_61 = v3692.var_num;
                assert(l_var_num_61);
                if l_var_num_61 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3693.args == 0 then
                        return "zero_vector3";
                    else
                        return "vector3";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "vector3";
                else
                    return "vector";
                end;
            end, 
            ["Vector2.new"] = function(v3695, v3696)
                local l_var_num_62 = v3695.var_num;
                assert(l_var_num_62);
                if l_var_num_62 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3696.args == 0 then
                        return "zero_vector2";
                    else
                        return "vector2";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "vector2";
                else
                    return "vector";
                end;
            end, 
            ["UDim.new"] = function(v3698, v3699)
                local l_var_num_63 = v3698.var_num;
                assert(l_var_num_63);
                if l_var_num_63 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3699.args == 0 then
                        return "zero_udim";
                    else
                        return "udim";
                    end;
                else
                    return "udim";
                end;
            end, 
            ["UDim2.new"] = function(v3701, v3702)
                local l_var_num_64 = v3701.var_num;
                assert(l_var_num_64);
                if l_var_num_64 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3702.args == 0 then
                        return "zero_udim2";
                    else
                        return "udim2";
                    end;
                else
                    return "udim2";
                end;
            end, 
            ["UDim2.fromOffset"] = function(v3704, v3705)
                local l_var_num_65 = v3704.var_num;
                assert(l_var_num_65);
                if l_var_num_65 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3705.args == 0 then
                        return "zero_udim2";
                    else
                        return "udim2";
                    end;
                else
                    return "udim2";
                end;
            end, 
            ["UDim2.fromScale"] = function(v3707, v3708)
                local l_var_num_66 = v3707.var_num;
                assert(l_var_num_66);
                if l_var_num_66 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3708.args == 0 then
                        return "zero_udim2";
                    else
                        return "udim2";
                    end;
                else
                    return "udim2";
                end;
            end, 
            ["CFrame.new"] = function(v3710, v3711)
                local l_var_num_67 = v3710.var_num;
                assert(l_var_num_67);
                if l_var_num_67 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3711.args == 0 then
                    return "zero_cframe";
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.Angles"] = function(v3713, v3714)
                local l_var_num_68 = v3713.var_num;
                assert(l_var_num_68);
                if l_var_num_68 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3714.args < 3 then
                    return "NEVER" .. (v3459 and "_cframe" or "");
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.fromEulerAnglesXYZ"] = function(v3716, v3717)
                local l_var_num_69 = v3716.var_num;
                assert(l_var_num_69);
                if l_var_num_69 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3717.args < 3 then
                    return "NEVER" .. (v3459 and "_cframe" or "");
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.fromEulerAnglesYXZ"] = function(v3719, v3720)
                local l_var_num_70 = v3719.var_num;
                assert(l_var_num_70);
                if l_var_num_70 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3720.args < 3 then
                    return "NEVER" .. (v3459 and "_cframe" or "");
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.fromEulerAngles"] = function(v3722, v3723)
                local l_var_num_71 = v3722.var_num;
                assert(l_var_num_71);
                if l_var_num_71 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3723.args < 3 then
                    return "NEVER" .. (v3459 and "_cframe" or "");
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.fromOrientation"] = function(v3725, v3726)
                local l_var_num_72 = v3725.var_num;
                assert(l_var_num_72);
                if l_var_num_72 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3726.args < 3 then
                    return "NEVER" .. (v3459 and "_cframe" or "");
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.lookAt"] = function(v3728, v3729)
                local l_var_num_73 = v3728.var_num;
                assert(l_var_num_73);
                if l_var_num_73 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3729.args < 2 then
                    return "NEVER" .. (v3459 and "_cframe_looking_at" or "");
                elseif v1129.smart_var_level >= 2 then
                    return "cframe_looking_at";
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.lookAlong"] = function(v3731, v3732)
                local l_var_num_74 = v3731.var_num;
                assert(l_var_num_74);
                if l_var_num_74 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3732.args < 2 then
                    return "NEVER" .. (v3459 and "_cframe_looking_along" or "");
                elseif v1129.smart_var_level >= 2 then
                    return "cframe_looking_along";
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.fromMatrix"] = function(v3734, v3735)
                local l_var_num_75 = v3734.var_num;
                assert(l_var_num_75);
                if l_var_num_75 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3735.args < 3 then
                    return "NEVER" .. (v3459 and "_cframe_matrix" or "");
                elseif v1129.smart_var_level >= 2 then
                    return "cframe_matrix";
                else
                    return "cframe";
                end;
            end, 
            ["CFrame.fromAxisAngle"] = function(v3737, v3738)
                local l_var_num_76 = v3737.var_num;
                assert(l_var_num_76);
                if l_var_num_76 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 and #v3738.args < 2 then
                    return "NEVER" .. (v3459 and "_cframe_axis_angle" or "");
                elseif v1129.smart_var_level >= 2 then
                    return "cframe_axis_angle";
                else
                    return "cframe";
                end;
            end, 
            ["game.GetService"] = function(v3740, v3741)
                local l_var_num_77 = v3740.var_num;
                assert(l_var_num_77);
                if l_var_num_77 > 1 then
                    return v3458;
                else
                    local l_args_13 = v3741.args;
                    if v1129.smart_var_level >= 3 and #l_args_13 == 0 then
                        return "NEVER" .. (v3459 and "_service" or "");
                    else
                        l_var_num_77 = if v1129.smart_var_level >= 3 then l_args_13 else {
                            l_args_13[1]
                        };
                        local v3744 = nil;
                        for _, v3746 in ipairs(l_var_num_77) do
                            if v3746.t == "constant" and v1129.smart_var_level >= 2 then
                                local l_const_10 = v3746.const;
                                if l_const_10.type == 3 then
                                    return l_const_10.value .. (v3459 and "_service" or "");
                                elseif v1129.smart_var_level >= 3 then
                                    v3744 = true;
                                end;
                            end;
                        end;
                        if v3744 then
                            return "NEVER" .. (v3459 and "_service" or "");
                        elseif v1129.smart_var_level >= 2 then
                            return "service";
                        else
                            return;
                        end;
                    end;
                end;
            end, 
            select = function(v3748, v3749)
                local l_var_num_78 = v3748.var_num;
                assert(l_var_num_78);
                if l_var_num_78 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 2 then
                    local l_args_14 = v3749.args;
                    l_var_num_78 = l_args_14[1];
                    if l_var_num_78 then
                        if l_var_num_78.t == "constant" then
                            local l_const_11 = l_var_num_78.const;
                            if l_const_11.type == 3 and l_const_11.value == "#" then
                                if #l_args_14 == 2 and l_args_14[2].t == "varargs" then
                                    return "arg_count";
                                else
                                    return "len";
                                end;
                            end;
                        end;
                        if #l_args_14 == 2 and l_args_14[2].t == "varargs" then
                            return "selected_arg";
                        else
                            return "selected";
                        end;
                    else
                        return "NEVER";
                    end;
                else
                    return;
                end;
            end, 
            require = function(v3753, v3754)
                local l_var_num_79 = v3753.var_num;
                assert(l_var_num_79);
                if l_var_num_79 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 2 then
                    l_var_num_79 = v3754.args[1];
                    if l_var_num_79 then
                        local v3756 = nil;
                        if not (l_var_num_79.t ~= "constant index") or l_var_num_79.t == "get table" then
                            local _ = l_var_num_79.const;
                            local v3758, _ = v3473(l_var_num_79);
                            local _ = nil;
                            local v3761 = string.reverse(v3758);
                            local v3762 = string.find(v3761, "%.");
                            v3756 = if v3762 then string.sub(v3758, #v3758 - v3762 + 2, #v3758) else v3758;
                        elseif not (l_var_num_79.t ~= "name") or l_var_num_79.t == "global" then
                            v3756 = if l_var_num_79.t == "name" then l_var_num_79.name.name else if l_var_num_79.name.type == 3 then l_var_num_79.name.value else "INVALIDGLOBAL";
                        end;
                        if v3756 then
                            return (v3459 and "module_" or "") .. v3756;
                        elseif l_var_num_79.t == "constant" then
                            local l_const_13 = l_var_num_79.const;
                            if l_const_13.type == 2 then
                                return "external_module";
                            elseif l_const_13.type == 3 then
                                return (v3459 and "module_" or "") .. v545(l_const_13.value, true, true);
                            end;
                        else
                            return "module";
                        end;
                    end;
                    return "NEVER";
                else
                    return;
                end;
            end, 
            ["table.clear"] = function(_, _)
                return v3458;
            end, 
            ["table.foreach"] = function(_, _)
                return v3458;
            end, 
            ["table.foreachi"] = function(_, _)
                return v3458;
            end, 
            ["table.insert"] = function(_, _)
                return v3458;
            end, 
            ["table.sort"] = function(_, _)
                return v3458;
            end, 
            ["table.clone"] = function(v3774, v3775)
                local l_var_num_80 = v3774.var_num;
                assert(l_var_num_80);
                if l_var_num_80 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3775.args == 0 then
                        return "NEVER";
                    else
                        return "cloned" .. (v3459 and "_tbl" or "");
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "cloned";
                else
                    return "tbl";
                end;
            end, 
            ["table.concat"] = function(v3777, v3778)
                local l_var_num_81 = v3777.var_num;
                assert(l_var_num_81);
                if l_var_num_81 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3778.args < 2 then
                        return "NEVER";
                    else
                        return "concatenated" .. (v3459 and "_tbl" or "");
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "concatenated";
                else
                    return "str";
                end;
            end, 
            ["table.getn"] = function(v3780, v3781)
                local l_var_num_82 = v3780.var_num;
                assert(l_var_num_82);
                if l_var_num_82 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3781.args == 0 then
                        return "NEVER";
                    else
                        return (v3459 and "tbl_" or "") .. "len";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "len";
                else
                    return "num";
                end;
            end, 
            ["table.maxn"] = function(v3783, v3784)
                local l_var_num_83 = v3783.var_num;
                assert(l_var_num_83);
                if l_var_num_83 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3784.args == 0 then
                        return "NEVER";
                    else
                        return (v3459 and "tbl_" or "") .. "highest_value";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "highest_value";
                else
                    return "num";
                end;
            end, 
            ["table.isfrozen"] = function(v3786, v3787)
                local l_var_num_84 = v3786.var_num;
                assert(l_var_num_84);
                if l_var_num_84 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3787.args == 0 then
                        return "NEVER";
                    else
                        return (v3459 and "tbl_" or "") .. "is_frozen";
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "is_frozen";
                else
                    return "bool";
                end;
            end, 
            ["table.pack"] = function(v3789, _)
                local l_var_num_85 = v3789.var_num;
                assert(l_var_num_85);
                if l_var_num_85 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    return "packed" .. (v3459 and "_tbl" or "");
                elseif v1129.smart_var_level >= 2 then
                    return "packed";
                else
                    return "tbl";
                end;
            end, 
            ["table.unpack"] = function(v3792, _)
                if v1129.smart_var_level >= 2 then
                    local v3794 = "unpacked_value_";
                    local l_var_num_86 = v3792.var_num;
                    assert(l_var_num_86);
                    return v3794 .. l_var_num_86;
                else
                    return;
                end;
            end, 
            ["table.remove"] = function(v3796, v3797)
                local l_var_num_87 = v3796.var_num;
                assert(l_var_num_87);
                if l_var_num_87 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3797.args == 0 then
                        return "NEVER";
                    elseif #v3797.args == 1 then
                        return "popped" .. (v3459 and "_last_value" or "");
                    else
                        return "popped" .. (v3459 and "_value" or "");
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "popped";
                else
                    return;
                end;
            end, 
            ["table.move"] = function(v3799, v3800)
                local l_var_num_88 = v3799.var_num;
                assert(l_var_num_88);
                if l_var_num_88 > 1 then
                    return v3458;
                elseif v1129.smart_var_level >= 3 then
                    if #v3800.args < 4 then
                        return "NEVER";
                    else
                        return "moved" .. (v3459 and "_tbl" or "");
                    end;
                elseif v1129.smart_var_level >= 2 then
                    return "moved";
                else
                    return "tbl";
                end;
            end, 
            ["coroutine.running"] = function(v3802, _)
                local l_var_num_89 = v3802.var_num;
                assert(l_var_num_89);
                if l_var_num_89 > 1 then
                    return v3458;
                else
                    return "current_thread";
                end;
            end
        };
        if v1129.smart_var_level >= 3 then
            local _ = function(v3805)
                local v3806 = l_Clone_0[v3805];
                assert(v3806);
                local l_v3543_0 = v3543;
                local _ = nil;
                local v3809 = string.reverse(v3805);
                local v3810 = string.find(v3809, "%.");
                l_v3543_0[if v3810 then string.sub(v3805, #v3805 - v3810 + 2, #v3805) else v3805] = v3806;
            end;
            local _ = function(v3812)
                local v3813 = l_Clone_0[v3812];
                assert(v3813);
                if v1129.smart_var_level >= 4 then
                    local l_v3543_1 = v3543;
                    local _ = nil;
                    local v3816 = string.reverse(v3812);
                    local v3817 = string.find(v3816, "%.");
                    l_v3543_1[if v3817 then string.sub(v3812, #v3812 - v3817 + 2, #v3812) else v3812] = v3813;
                    return;
                else
                    local l_v3543_2 = v3543;
                    local _ = nil;
                    local v3820 = string.reverse(v3812);
                    local v3821 = string.find(v3820, "%.");
                    l_v3543_2[if v3821 then string.sub(v3812, #v3812 - v3821 + 2, #v3812) else v3812] = function(v3822, v3823)
                        local v3824 = v3813(v3822, v3823);
                        if v3824 then
                            if string.match(v3824, "NEVER") then
                                return;
                            else
                                return v3824;
                            end;
                        else
                            return;
                        end;
                    end;
                    return;
                end;
            end;
            local v3826 = l_Clone_0["game.GetService"];
            assert(v3826);
            if v1129.smart_var_level >= 4 then
                local _ = nil;
                local v3828 = string.reverse("game.GetService");
                local v3829 = string.find(v3828, "%.");
                v3543[if v3829 then string.sub("game.GetService", 15 - v3829 + 2, 15) else "game.GetService"] = v3826;
            else
                local _ = nil;
                local v3831 = string.reverse("game.GetService");
                local v3832 = string.find(v3831, "%.");
                local l_v3826_0 = v3826 --[[ copy: 114 -> 161 ]];
                v3543[if v3832 then string.sub("game.GetService", 15 - v3832 + 2, 15) else "game.GetService"] = function(v3834, v3835)
                    local v3836 = l_v3826_0(v3834, v3835);
                    if v3836 then
                        if string.match(v3836, "NEVER") then
                            return;
                        else
                            return v3836;
                        end;
                    else
                        return;
                    end;
                end;
            end;
        end;
        local v3837 = nil;
        v3837 = {
            call = function(v3838, v3839, _)
                local l_func_0 = v3839.func;
                if not (l_func_0.t ~= "constant index") or l_func_0.t == "get table" then
                    local v3842, v3843 = v3473(l_func_0);
                    if v3843 and v1129.smart_var_level < 2 then
                        return;
                    else
                        if v1129.smart_var_level >= 2 then
                            local l_v3543_3 = v3543;
                            local _ = nil;
                            local v3846 = string.reverse(v3842);
                            local v3847 = string.find(v3846, "%.");
                            local v3848 = l_v3543_3[if v3847 then string.sub(v3842, #v3842 - v3847 + 2, #v3842) else v3842];
                            if v3848 then
                                l_v3543_3 = v3848(v3838, v3839);
                                if l_v3543_3 then
                                    return l_v3543_3;
                                end;
                            end;
                        end;
                        local v3849 = l_Clone_0[v3842];
                        if v3849 then
                            return v3849(v3838, v3839);
                        elseif v1129.smart_var_level >= 3 then
                            return v545(v3842, nil, true) .. "_result" .. (v3838.var_num or "");
                        end;
                    end;
                elseif not (l_func_0.t ~= "name") or l_func_0.t == "global" then
                    local v3850 = nil;
                    v3850 = if l_func_0.t == "name" then l_func_0.name.name else if l_func_0.name.type == 3 then l_func_0.name.value else "INVALIDGLOBAL";
                    local v3851 = l_Clone_0[v3850];
                    if v3851 then
                        return v3851(v3838, v3839);
                    elseif v1129.smart_var_level >= 3 then
                        return v545(v3850, nil, true) .. "_result" .. (v3838.var_num or "");
                    end;
                end;
            end, 
            ["new table"] = function(v3852, v3853, _)
                local v3855 = false;
                local l_initializers_0 = v3853.initializers;
                local v3857 = "";
                if v1129.smart_var_level >= 2 then
                    if #l_initializers_0 == 0 then
                        if next(l_initializers_0) then
                            v3857 = v3459 and "_dict" or "";
                        end;
                    else
                        v3857 = if next(l_initializers_0) then v3459 and "_mixed" or "" else v3459 and "_list" or "";
                    end;
                end;
                local v3858 = "";
                if v1129.smart_var_usage_analysis then
                    local v3859 = true;
                    for _, v3861 in ipairs(v3852.reads) do
                        if v3861.t == "set table" then
                            v3859 = false;
                            break;
                        end;
                    end;
                    if v3859 then
                        v3858 = v3459 and "const_" or "";
                    end;
                end;
                for _, v3863 in ipairs(l_initializers_0) do
                    if v3863.t == "varargs" then
                        if v1129.smart_var_level >= 2 then
                            v3857 = v3857 .. "_varargs";
                        end;
                        if #l_initializers_0 == 1 then
                            if v1129.smart_var_level >= 3 then
                                return "args_list";
                            else
                                return "args";
                            end;
                        else
                            break;
                        end;
                    end;
                end;
                local l_reads_2 = v3852.reads;
                local v3865 = l_reads_2[#l_reads_2];
                local v3866;
                if v3865 and v3865.t == "return" then
                    local v3867 = {};
                    local l_values_1 = v3865.values;
                    if v1129.smart_var_level == 3 then
                        v3866 = true;
                        v3855 = true;
                    elseif #v3867 == 1 then
                        v3867 = l_values_1;
                    else
                        v3866 = nil;
                        v3855 = true;
                    end;
                end;
                if not v3855 then
                    if not v3855 then
                        v3866 = nil;
                    end;
                end;
                v3855 = false;
                if v3866 then
                    return v3858 .. "module" .. v3857;
                else
                    return v3858 .. "tbl" .. v3857;
                end;
            end, 
            ["constant index"] = function(_, v3870, _)
                if v1129.smart_var_level >= 2 then
                    return (v545(v550(v3870.index, v1129.string_quotes_behavior, true)));
                else
                    return;
                end;
            end, 
            ["get table"] = function(_, v3873, _)
                if v1129.smart_var_level >= 2 then
                    local l_index_5 = v3873.index;
                    if l_index_5.t == "constant" then
                        local v3876 = v550(l_index_5.const, v1129.string_quotes_behavior, true);
                        if l_index_5.const.type ~= 3 then
                            v3876 = "_" .. v3876;
                        end;
                        return (v545(v3876));
                    end;
                end;
            end, 
            constant = function(v3877, v3878, _)
                if not v1129.smart_var_usage_analysis then
                    return;
                else
                    local v3880 = #v3877.writes <= 1;
                    if v3880 then
                        for _, v3882 in ipairs(v3877.reads) do
                            if v3882.t == "set table" then
                                v3880 = false;
                                break;
                            end;
                        end;
                    end;
                    if v3880 then
                        local l_type_9 = v3878.const.type;
                        if l_type_9 == 1 then
                            return "const_boolean";
                        elseif l_type_9 == 6 then
                            return "const_function";
                        elseif l_type_9 == 4 then
                            return "const_import";
                        elseif l_type_9 == 0 then
                            return "const_nil";
                        elseif l_type_9 == 3 then
                            return "const_string";
                        elseif l_type_9 == 2 then
                            return "const_number";
                        elseif l_type_9 == 5 then
                            return "const_table";
                        elseif l_type_9 == 7 then
                            return "const_vector";
                        else
                            return "const_unknown";
                        end;
                    else
                        return;
                    end;
                end;
            end, 
            length = function(_, v3885, _)
                if v1129.smart_var_level >= 2 then
                    local l_rhs_8 = v3885.rhs;
                    while l_rhs_8.t == "name" do
                        local l_override_expr_18 = l_rhs_8.name.override_expr;
                        if l_override_expr_18 then
                            l_rhs_8 = l_override_expr_18;
                        else
                            break;
                        end;
                    end;
                    local l_l_rhs_8_0 = l_rhs_8;
                    if l_l_rhs_8_0.t == "name" then
                        l_rhs_8 = l_l_rhs_8_0.name.name;
                        if not (l_rhs_8 ~= "args") or l_rhs_8 == "args_list" then
                            return "arg_count";
                        end;
                    elseif l_l_rhs_8_0.t == "new table" then
                        l_rhs_8 = l_l_rhs_8_0.initializers;
                        if #l_rhs_8 == 1 and l_rhs_8[1].t == "varargs" then
                            return "arg_count";
                        end;
                    end;
                    return "len";
                else
                    return;
                end;
            end, 
            global = function(_, v3891, _)
                return (v545(v550(v3891.name, v1129.string_quotes_behavior, true)));
            end
        };
        local function _(v3893, v3894)
            local v3895 = v3837[v3894.t];
            if v3895 then
                local v3896 = v3895(v3893, v3894, true);
                if v3896 then
                    return v3896;
                end;
            end;
        end;
        for _, v3899 in pairs(table.clone(v1206)) do
            local l_attributes_1 = v3899.attributes;
            local l_name_16 = v3899.name;
            local l_l_name_16_0 = l_name_16;
            local l_init_expr_2 = v3899.init_expr;
            if l_init_expr_2 then
                if v1129.smart_var_level > 0 then
                    local v3904 = v3837[l_init_expr_2.t];
                    l_name_16 = v3904 and v3904(v3899, l_init_expr_2, true) or nil or l_name_16;
                end;
                if l_name_16 ~= l_l_name_16_0 then
                    local l_l_name_16_1 = l_name_16;
                    local v3906 = v1213[l_l_name_16_1];
                    local l_l_l_name_16_1_0 = l_l_name_16_1;
                    local v3908 = v3906 or 1;
                    while v1206[l_l_l_name_16_1_0] or v1141[l_l_l_name_16_1_0] do
                        v3908 = v3908 + 1;
                        l_l_l_name_16_1_0 = l_l_name_16_1 .. "_" .. v3908;
                    end;
                    v1213[l_l_name_16_1] = v3908;
                    l_name_16 = l_l_l_name_16_1_0;
                end;
                if l_attributes_1.is_upvalue and v1129.mark_upvalues then
                    local v3909 = if v1129.mark_upvalues == "extra" then if l_attributes_1.is_upvalue == "read" then l_name_16 .. "_upvr" else l_name_16 .. "_upvw" else l_name_16 .. "_upv";
                    local v3910 = v1213[v3909];
                    local l_v3909_0 = v3909;
                    local v3912 = v3910 or 1;
                    while v1206[l_v3909_0] or v1141[l_v3909_0] do
                        v3912 = v3912 + 1;
                        l_v3909_0 = v3909 .. "_" .. v3912;
                    end;
                    v1213[v3909] = v3912;
                    l_name_16 = l_v3909_0;
                end;
                local l_l_name_16_2 = l_name_16;
                local l_name_17 = v3899.name;
                if not v1206[l_name_17] then
                    error((("[write] Variable %* not allocated"):format(l_name_17)));
                end;
                v1206[l_name_17] = nil;
                v3899.name = l_l_name_16_2;
                v1206[l_l_name_16_2] = v3899;
                v3899.attributes.renamed = true;
            end;
        end;
        v1128:end_benchmark("Smart Naming");
        v1128:start_benchmark("Global AST To String");
        local v3915 = ("-- Decompiled with Konstant V%*, a fast Luau decompiler made in Luau by plusgiant5\n"):format("2.1");
        if type(v1125) ~= "string" and l_getscripthash_0 then
            v3915 = v3915 .. ("-- Script hash: %*\n"):format((string.upper(l_getscripthash_0(v1125))));
        end;
        v3915 = (v3915 .. ("-- Decompiled on %*\n"):format((os.date("%Y-%m-%d %H:%M:%S")))) .. ("-- Luau version %*%*\n"):format(string.byte(v1125, 1, 1), if v1140 then (", Types version %*"):format(v1140) else "");
        local v3916 = if v1129.spaces_in_indentation then string.rep(" ", v1129.spaces_in_indentation) else string.char(9);
        local function v3918(v3917)
            return string.rep(v3916, #v3917 / #v3916 + 1);
        end;
        local v3919 = nil;
        local v3920 = nil;
        local v3921 = nil;
        local v3922 = {};
        local v3923 = 0;
        local function _()
            v3923 = v3923 + #v3915;
            table.insert(v3922, v3915);
            v3915 = "";
        end;
        local function _(v3925, v3926)
            v3923 = v3923 + #v3925;
            table.insert(v3922, v3926, v3925);
        end;
        local function _(v3928)
            local l_v3915_0 = v3915;
            v3923 = v3923 + #l_v3915_0;
            table.insert(v3922, v3928, l_v3915_0);
            v3915 = "";
        end;
        local function _()
            if #v3915 > 20 then
                v3923 = v3923 + #v3915;
                table.insert(v3922, v3915);
                v3915 = "";
            end;
        end;
        v3923 = v3923 + #v3915;
        table.insert(v3922, v3915);
        v3915 = "";
        local function _(v3932)
            local v3933 = nil;
            local l_type_10 = v3932.type;
            v3933 = l_type_10 == "table" and "{[any]: any}" or l_type_10 == "function" and "_function_" or l_type_10 == "thread" and "_thread_" or l_type_10 == "userdata" and "_userdata_" or l_type_10 == "invalid" and "_invalid_" or l_type_10;
            if v3932.optional then
                return v3933 .. "?";
            else
                return v3933;
            end;
        end;
        local function v3947(v3936, _)
            local l_is_vararg_0 = v3936.is_vararg;
            local l_args_15 = v3936.args;
            for v3940, v3941 in ipairs(l_args_15) do
                v3915 = v3915 .. v3941.name;
                if v3941.luau_type then
                    local l_v3915_1 = v3915;
                    local v3943 = ": ";
                    local l_luau_type_0 = v3941.luau_type;
                    local v3945 = nil;
                    local l_type_11 = l_luau_type_0.type;
                    v3945 = l_type_11 == "table" and "{[any]: any}" or l_type_11 == "function" and "_function_" or l_type_11 == "thread" and "_thread_" or l_type_11 == "userdata" and "_userdata_" or l_type_11 == "invalid" and "_invalid_" or l_type_11;
                    v3915 = l_v3915_1 .. v3943 .. if l_luau_type_0.optional then v3945 .. "?" else v3945;
                end;
                if v3940 < #l_args_15 then
                    v3915 = v3915 .. ", ";
                end;
            end;
            if l_is_vararg_0 then
                if #l_args_15 > 0 then
                    v3915 = v3915 .. ", ";
                end;
                v3915 = v3915 .. "...";
            end;
        end;
        local function _(v3948)
            return v3948 and v3948.precedence or -100;
        end;
        local function _(v3950, v3951)
            local l_t_4 = v3950.t;
            if l_t_4 ~= v3951.t then
                return false;
            elseif l_t_4 == "constant" then
                return v3950.const.value == v3951.const.value;
            elseif l_t_4 == "name" then
                return v3950.name == v3951.name;
            else
                return true;
            end;
        end;
        local function _(v3954, v3955)
            local l_override_expr_19 = v3954.override_expr;
            if l_override_expr_19 then
                v3919(l_override_expr_19, v3955);
                return;
            else
                v3915 = v3915 .. v3954.name;
                return;
            end;
        end;
        local _ = function(v3958, v3959, _)
            local v3961 = " -- ";
            local l_line_defined_0 = v3958.line_defined;
            if l_line_defined_0 then
                if l_line_defined_0 == -1 then
                    v3915 = v3915 .. " -- Internal function, doesn't exist in bytecode";
                    v3961 = ", ";
                elseif v1129.show_proto_line_defined then
                    v3915 = v3915 .. " -- Line " .. l_line_defined_0;
                    v3961 = ", ";
                end;
            end;
            if v3958.name_known and v3958.name ~= v3959 then
                v3915 = v3915 .. v3961 .. "Named \"" .. v3958.name .. "\"";
            end;
        end;
        local function v3970(v3964, v3965)
            if v1129.show_proto_upvalues then
                local l_upvalues_count_0 = v3964.upvalues_count;
                if l_upvalues_count_0 > 0 then
                    local v3967 = string.rep(v3916, #v3965 / #v3916 + 1);
                    v3915 = v3915 .. v3965 .. "--[[ Upvalues[" .. l_upvalues_count_0 .. "]:\n";
                    local l_upvalues_0 = v3964.upvalues;
                    for v3969 = 0, l_upvalues_count_0 - 1 do
                        v3915 = v3915 .. v3967 .. "[" .. v3969 + 1 .. "]: " .. l_upvalues_0[v3969].name.name .. " (";
                        if l_upvalues_0[v3969].name.name == v3964.name.name then
                            v3915 = v3915 .. "self-reference, ";
                        end;
                        v3915 = v3915 .. l_upvalues_0[v3969].access .. ")\n";
                    end;
                    v3915 = v3915 .. v3965 .. "]]\n";
                end;
            end;
        end;
        local function v3976(v3971, v3972)
            v3923 = v3923 + #v3915;
            table.insert(v3922, v3915);
            v3915 = "";
            local v3973 = string.rep(v3916, #v3972 / #v3916 + 1);
            v3970(v3971, v3973);
            v3923 = v3923 + #v3915;
            table.insert(v3922, v3915);
            v3915 = "";
            local l_v3922_0 = v3922;
            local l_ast_0 = v3971.ast;
            v3922 = table.create(#l_ast_0 * 5);
            v3920(l_ast_0, v3973);
            table.move(v3922, 1, #v3922, #l_v3922_0 + 1, l_v3922_0);
            v3922 = l_v3922_0;
            v3923 = v3923 + #v3915;
            table.insert(v3922, v3915);
            v3915 = "";
        end;
        local function v3981(v3977, v3978, v3979, _)
            if v3978 > 0 then
                if v3979 == 0 then
                    return v3977 .. " reads: " .. v3978;
                else
                    return v3977 .. " reads: " .. v3978 .. ", writes: " .. v3979;
                end;
            elseif v3979 ~= 0 then
                return v3977 .. " writes: " .. v3979;
            else
                return v3977 .. " unused";
            end;
        end;
        local function v3990(v3982, v3983)
            for v3984, v3985 in ipairs(v3982) do
                local l_v3915_2 = v3915;
                local v3987 = #v3982 == 1 and "-- Variable" or "-- Variables[" .. v3984 .. "]";
                local v3988 = #v3985.reads;
                local v3989 = #v3985.writes - 1;
                v3915 = l_v3915_2 .. (if v3988 > 0 then if v3989 == 0 then v3987 .. " reads: " .. v3988 else v3987 .. " reads: " .. v3988 .. ", writes: " .. v3989 else if v3989 ~= 0 then v3987 .. " writes: " .. v3989 else v3987 .. " unused") .. "\n" .. v3983;
            end;
        end;
        local v4105 = {
            nothing = function(_, _)
                error("Shouldn't happen !!!!!!!!!!");
            end, 
            comment = function(v3993, _)
                v3915 = v3915 .. "-- " .. v3993.text;
            end, 
            ["break"] = function(_, _)
                v3915 = v3915 .. "break";
            end, 
            continue = function(_, _)
                v3915 = v3915 .. "continue";
            end, 
            ["unknown jump"] = function(v3999, _)
                local v4001 = v1146[v3999];
                if v4001 then
                    local v4002 = v4001[v3999.destination];
                    if v4002 then
                        v3915 = v3915 .. ("-- %*: GOTO [%*] #%*"):format(l_prefix_warning_1, v4002.actual_code_index, v4002.actual_index);
                        return;
                    else
                        v3915 = v3915 .. ("-- %*: GOTO UNK2"):format(l_prefix_warning_1);
                        return;
                    end;
                else
                    v3915 = v3915 .. ("-- %*: GOTO UNK1"):format(l_prefix_warning_1);
                    return;
                end;
            end, 
            ["if"] = function(v4003, v4004)
                v3915 = v3915 .. "if ";
                v3919(v4003.expr, v4004);
                local v4005 = string.rep(v3916, #v4004 / #v3916 + 1);
                local v4006 = nil;
                if v1129.minify_if_statements and not v4003.else_ and #v4003.elseifs == 0 and #v4003.pass == 1 then
                    local v4007 = v4003.pass[1];
                    local l_t_5 = v4007.t;
                    if l_t_5 == "return" then
                        if #v4007.values == 0 then
                            v4006 = l_t_5;
                        end;
                    elseif not (l_t_5 ~= "continue") or l_t_5 == "break" then
                        v4006 = l_t_5;
                    end;
                end;
                if v4006 then
                    v3915 = v3915 .. " then " .. v4006 .. " end";
                    return;
                else
                    v3915 = v3915 .. " then\n";
                    v3920(v4003.pass, v4005);
                    for _, v4010 in ipairs(v4003.elseifs) do
                        v3915 = v3915 .. v4004 .. "elseif ";
                        v3919(v4010.expr, v4004);
                        v3915 = v3915 .. " then\n";
                        v3920(v4010.code, v4005);
                    end;
                    if v4003.else_ then
                        v3915 = v3915 .. v4004 .. "else\n";
                        v3920(v4003.else_, v4005);
                    end;
                    v3915 = v3915 .. v4004 .. "end";
                    return;
                end;
            end, 
            ["for"] = function(v4011, v4012)
                local v4013 = false;
                local l_for_info_3 = v4011.for_info;
                local l_variables_2 = l_for_info_3.variables;
                assert(l_variables_2);
                if v1129.mark_reads_and_writes then
                    v3990(l_variables_2, v4012);
                end;
                local v4016 = #l_variables_2;
                v3915 = v3915 .. "for ";
                for v4017, v4018 in ipairs(l_variables_2) do
                    v3915 = v3915 .. v4018.name;
                    if v4017 ~= v4016 then
                        v3915 = v3915 .. ", ";
                    end;
                end;
                local l_type_12 = l_for_info_3.type;
                if l_type_12 == "numeric" then
                    v3915 = v3915 .. " = ";
                    local l_args_16 = l_for_info_3.args;
                    assert(l_args_16.index_expr);
                    assert(l_args_16.end_expr);
                    assert(l_args_16.step_expr);
                    v3919(l_args_16.index_expr, v4012);
                    v3915 = v3915 .. ", ";
                    v3919(l_args_16.end_expr, v4012);
                    local l_step_expr_1 = l_args_16.step_expr;
                    while true do
                        if not (l_step_expr_1.t == "name") then
                            break;
                        end;
                        local l_override_expr_20 = l_step_expr_1.name.override_expr;
                        if l_override_expr_20 then
                            l_step_expr_1 = l_override_expr_20;
                        else
                            break;
                        end;
                    end;
                    local l_l_step_expr_1_0 = l_step_expr_1;
                    assert(l_l_step_expr_1_0);
                    if l_l_step_expr_1_0.t == "constant" then
                        l_step_expr_1 = l_l_step_expr_1_0.const;
                        v4013 = not (not (l_step_expr_1.type == 2) or l_step_expr_1.value ~= 1);
                    end;
                    if not v4013 then
                        v3915 = v3915 .. ", ";
                        v3919(l_l_step_expr_1_0, v4012);
                    end;
                elseif l_type_12 == "generic" then
                    v3915 = v3915 .. " in ";
                    local l_args_17 = l_for_info_3.args;
                    local l_generator_expr_2 = l_args_17.generator_expr;
                    assert(l_generator_expr_2);
                    local v4026 = nil;
                    local l_state_expr_1 = l_args_17.state_expr;
                    local l_index_expr_2 = l_args_17.index_expr;
                    local v4029 = nil;
                    if not l_index_expr_2 or l_index_expr_2.t == "nil" then
                        v4029 = if not l_state_expr_1 or l_state_expr_1.t == "nil" then not v219[l_generator_expr_2.t] else not v219[l_state_expr_1.t];
                    end;
                    v4026 = if l_index_expr_2 then if l_state_expr_1 then if l_state_expr_1.t == "nil" and l_index_expr_2.t == "nil" then {
                        l_generator_expr_2, 
                        l_state_expr_1
                    } else {
                        l_generator_expr_2, 
                        l_state_expr_1, 
                        l_index_expr_2
                    } else {
                        l_generator_expr_2, 
                        v1283(), 
                        l_index_expr_2
                    } else if l_state_expr_1 then {
                        l_generator_expr_2, 
                        l_state_expr_1
                    } else {
                        l_generator_expr_2
                    };
                    if v4029 then
                        while true do
                            if not (#v4026 > 1 and v4026[#v4026].t == "nil") then
                                break;
                            end;
                            table.remove(v4026);
                        end;
                    end;
                    local v4030 = #v4026;
                    for v4031, v4032 in ipairs(v4026) do
                        if type(v4032) == "number" then
                            v3915 = v3915 .. "nil";
                        else
                            v3919(v4032, v4012);
                        end;
                        if v4031 < v4030 then
                            v3915 = v3915 .. ", ";
                        end;
                    end;
                else
                    error((("Unknown for_type \"%*\""):format(l_type_12)));
                end;
                v4013 = false;
                v3915 = v3915 .. " do\n";
                v3920(v4011.code, v3918(v4012));
                v3915 = v3915 .. v4012 .. "end";
            end, 
            ["while"] = function(v4033, v4034)
                if v4033.expr then
                    v3915 = v3915 .. "while ";
                    v3919(v4033.expr, v4034);
                    v3915 = v3915 .. " do\n";
                elseif v1129.do_while_1 then
                    v3915 = v3915 .. "while 1 do\n";
                else
                    v3915 = v3915 .. "while true do\n";
                end;
                v3920(v4033.code, v3918(v4034));
                v3915 = v3915 .. v4034 .. "end";
            end, 
            ["repeat"] = function(v4035, v4036)
                v3915 = v3915 .. "repeat\n";
                v3920(v4035.code, v3918(v4036));
                if v4035.expr then
                    v3915 = v3915 .. v4036 .. "until ";
                    v3919(v4035.expr, v4036);
                    return;
                else
                    v3915 = v3915 .. v4036 .. "until nil";
                    return;
                end;
            end, 
            ["do"] = function(v4037, v4038)
                v3915 = v3915 .. "do\n";
                v3920(v4037.content, v3918(v4038));
                v3915 = v3915 .. v4038 .. "end";
            end, 
            call = function(v4039, v4040)
                local l_func_1 = v4039.func;
                while l_func_1.t == "name" do
                    local l_override_expr_21 = l_func_1.name.override_expr;
                    if l_override_expr_21 then
                        l_func_1 = l_override_expr_21;
                    else
                        break;
                    end;
                end;
                local l_l_func_1_0 = l_func_1;
                if l_l_func_1_0.t == "constant index" then
                    l_func_1 = l_l_func_1_0.table;
                    if l_func_1.t == "constant" then
                        local l_const_14 = l_func_1.const;
                        if l_const_14.type == 3 then
                            local function _(v4045)
                                return (string.gsub(v4045, "%%%%", "%%"));
                            end;
                            local l_value_13 = l_const_14.value;
                            local v4048 = buffer.fromstring(l_value_13);
                            local v4049 = {};
                            local v4050 = 1;
                            local v4051 = false;
                            for v4052 = 0, #l_value_13 - 1 do
                                local v4053 = buffer.readu8(v4048, v4052);
                                if v4053 == 37 then
                                    v4051 = not v4051;
                                else
                                    if v4053 == 42 and v4051 then
                                        local v4054 = string.sub(l_value_13, v4050, v4052 - 1);
                                        table.insert(v4049, (string.gsub(v4054, "%%%%", "%%")));
                                        v4050 = v4052 + 2;
                                    end;
                                    v4051 = false;
                                end;
                            end;
                            local v4055 = string.sub(l_value_13, v4050, #l_value_13);
                            table.insert(v4049, (string.gsub(v4055, "%%%%", "%%")));
                            if #v4049 - 1 == #v4039.args then
                                v3915 = v3915 .. "`";
                                v3923 = v3923 + #v3915;
                                table.insert(v3922, v3915);
                                v3915 = "";
                                for v4056, v4057 in ipairs(v4049) do
                                    v3915 = v3915 .. v460(v1129.string_quotes_behavior, v4057, true);
                                    v3923 = v3923 + #v3915;
                                    table.insert(v3922, v3915);
                                    v3915 = "";
                                    if v4056 < #v4049 then
                                        v3915 = v3915 .. "{";
                                        v3919(v4039.args[v4056], v4040);
                                        v3915 = v3915 .. "}";
                                        v3923 = v3923 + #v3915;
                                        table.insert(v3922, v3915);
                                        v3915 = "";
                                    end;
                                end;
                                v3915 = v3915 .. "`";
                                return;
                            end;
                        end;
                    end;
                end;
                l_func_1 = v3919;
                local l_l_l_func_1_0_0 = l_l_func_1_0;
                local l_v4040_0 = v4040;
                local v4060 = true;
                if l_l_func_1_0.t ~= "concatenation" then
                    v4060 = true;
                    if l_l_func_1_0.t ~= "function" then
                        v4060 = l_l_func_1_0.t == "constant" and l_l_func_1_0.const.type ~= 4 or (l_l_func_1_0 and l_l_func_1_0.precedence or -100) >= 0;
                    end;
                end;
                l_func_1(l_l_l_func_1_0_0, l_v4040_0, v4060);
                if v4039.namecall_method then
                    v3915 = v3915 .. ":" .. v4039.namecall_method .. "(";
                else
                    v3915 = v3915 .. "(";
                end;
                for v4061, v4062 in ipairs(v4039.args) do
                    v3919(v4062, v4040);
                    if v4061 < #v4039.args then
                        v3915 = v3915 .. ", ";
                    end;
                end;
                v3915 = v3915 .. ")";
            end, 
            ["define variable"] = function(v4063, v4064)
                if v1129.mark_reads_and_writes then
                    v3990(v4063.names, v4064);
                end;
                v3915 = v3915 .. "local ";
                for v4065, v4066 in ipairs(v4063.names) do
                    v3915 = v3915 .. v4066.name;
                    if v4065 < #v4063.names then
                        v3915 = v3915 .. ", ";
                    end;
                end;
                if (v1129.show_nil_definitions or v4063.value.t ~= "nil") and not v4063.value.invisible then
                    v3915 = v3915 .. " = ";
                    v3919(v4063.value, v4064);
                end;
            end, 
            ["define function"] = function(v4067, v4068)
                local l_func_2 = v4067.func;
                local l_define_function_type_0 = v4067.define_function_type;
                if v1129.mark_reads_and_writes and l_define_function_type_0 == "local" then
                    v3990({
                        l_func_2.varname
                    }, v4068);
                end;
                if l_define_function_type_0 == "local" then
                    v3915 = v3915 .. "local function " .. v4067.func_name.name .. "(";
                elseif l_define_function_type_0 == "table" then
                    v3915 = v3915 .. "function ";
                    local l_path_0 = v4067.path;
                    for v4072, v4073 in ipairs(l_path_0) do
                        if v4072 == #l_path_0 then
                            v3915 = v3915 .. v4073.name;
                        else
                            v3915 = v3915 .. v4073.name .. ".";
                        end;
                    end;
                    v3915 = v3915 .. "(";
                else
                    v3915 = v3915 .. "function " .. v4067.func_name.name .. "(";
                end;
                v3947(l_func_2, v4068);
                v3915 = v3915 .. ")";
                local l_name_18 = v4067.func_name.name;
                local v4075 = " -- ";
                local l_line_defined_1 = l_func_2.line_defined;
                if l_line_defined_1 then
                    if l_line_defined_1 == -1 then
                        v3915 = v3915 .. " -- Internal function, doesn't exist in bytecode";
                        v4075 = ", ";
                    elseif v1129.show_proto_line_defined then
                        v3915 = v3915 .. " -- Line " .. l_line_defined_1;
                        v4075 = ", ";
                    end;
                end;
                if l_func_2.name_known and l_func_2.name ~= l_name_18 then
                    v3915 = v3915 .. v4075 .. "Named \"" .. l_func_2.name .. "\"";
                end;
                v3915 = v3915 .. "\n";
                v3976(l_func_2, v4068);
                v3915 = v3915 .. v4068 .. "end";
            end, 
            ["set variable"] = function(v4077, v4078)
                v3915 = v3915 .. v4077.name.name;
                local v4079 = v214[v4077.value.t];
                local v4080 = false;
                if v4079 and v1129.use_compound_assignment then
                    if v4077.value.t == "concatenation" then
                        if #v4077.value.exprs > 1 and v4077.value.exprs[1].t == "global" and v4077.value.exprs[1].name == v4077.name then
                            v4080 = true;
                        end;
                    elseif v4077.value.lhs.t == "name" and v4077.name.name == v4077.value.lhs.name.name then
                        v4080 = true;
                    end;
                end;
                if v4080 then
                    v3915 = v3915 .. " " .. v4079 .. " ";
                    v3919(v4077.value.rhs, v4078);
                    return;
                else
                    v3915 = v3915 .. " = ";
                    v3919(v4077.value, v4078);
                    return;
                end;
            end, 
            ["set global"] = function(v4081, v4082)
                local _ = v4081.value;
                v3915 = v3915 .. v4081.name.value;
                local v4084 = v214[v4081.value.t];
                local v4085 = false;
                if v4084 and v1129.use_compound_assignment then
                    if v4081.value.t == "concatenation" then
                        if #v4081.value.exprs > 1 and v4081.value.exprs[1].t == "global" and v4081.value.exprs[1].name == v4081.name then
                            v4085 = true;
                        end;
                    elseif v4081.value.lhs.t == "constant" and v4081.name.value == v4081.value.lhs.const.value then
                        v4085 = true;
                    end;
                end;
                if v4085 then
                    v3915 = v3915 .. " " .. v4084 .. " ";
                    if v4081.value.t == "concatenation" then
                        local v4086 = table.clone(v4081.value);
                        local v4087 = table.clone(v4086.exprs);
                        table.remove(v4087, 1);
                        v4086.exprs = v4087;
                        v3919(v4086, v4082);
                    else
                        v3919(v4081.value.rhs, v4082);
                    end;
                else
                    v3915 = v3915 .. " = ";
                    v3919(v4081.value, v4082);
                end;
                if v1129.mark_setglobal then
                    v3915 = v3915 .. " -- Setting global";
                end;
            end, 
            ["set table"] = function(v4088, v4089)
                local l_table_2 = v4088.table;
                while l_table_2.t == "name" do
                    local l_override_expr_22 = l_table_2.name.override_expr;
                    if l_override_expr_22 then
                        l_table_2 = l_override_expr_22;
                    else
                        break;
                    end;
                end;
                local l_l_table_2_0 = l_table_2;
                v3919(l_l_table_2_0, v4089, l_l_table_2_0.t == "new table");
                if v4088.key.t == "constant" and v4088.key.const.type == 3 and v538(v4088.key.const.value) then
                    v3915 = v3915 .. "." .. v4088.key.const.value .. " ";
                else
                    v3915 = v3915 .. "[";
                    v3919(v4088.key, v4089);
                    v3915 = v3915 .. "] ";
                end;
                l_table_2 = v214[v4088.value.t];
                local v4093 = false;
                if l_table_2 and v1129.use_compound_assignment then
                    local v4094 = nil;
                    if v4088.value.t == "concatenation" then
                        if l_l_table_2_0.t == "name" and v4088.value.exprs[1].t == "get table" and v4088.value.exprs[1].table.t == "name" and l_l_table_2_0.name == v4088.value.exprs[1].table.name then
                            v4094 = v4088.value.exprs[1].index;
                        end;
                    elseif l_l_table_2_0.t == "name" and v4088.value.lhs.t == "get table" and v4088.value.lhs.table.t == "name" and l_l_table_2_0.name == v4088.value.lhs.table.name then
                        v4094 = v4088.value.lhs.index;
                    end;
                    if v4094 then
                        local l_v4094_0 = v4094;
                        local l_key_2 = v4088.key;
                        local l_t_6 = l_v4094_0.t;
                        if l_t_6 == l_key_2.t and if l_t_6 == "constant" then l_v4094_0.const.value == l_key_2.const.value else not (l_t_6 == "name") or l_v4094_0.name == l_key_2.name then
                            v4093 = true;
                        end;
                    end;
                end;
                if v4093 then
                    v3915 = v3915 .. l_table_2 .. " ";
                    if v4088.value.t == "concatenation" then
                        local v4098 = table.clone(v4088.value);
                        local v4099 = table.clone(v4098.exprs);
                        table.remove(v4099, 1);
                        v4098.exprs = v4099;
                        v3919(v4098, v4089);
                        return;
                    else
                        v3919(v4088.value.rhs, v4089);
                        return;
                    end;
                else
                    v3915 = v3915 .. "= ";
                    v3919(v4088.value, v4089);
                    return;
                end;
            end, 
            ["return"] = function(v4100, v4101)
                v3915 = v3915 .. "return";
                local l_values_2 = v4100.values;
                local v4103 = #l_values_2;
                if v4103 > 0 then
                    v3915 = v3915 .. " ";
                end;
                for v4104 = 1, v4103 do
                    v3919(l_values_2[v4104], v4101);
                    if v4104 < v4103 then
                        v3915 = v3915 .. ", ";
                    end;
                end;
            end
        };
        local v4236 = {
            global = function(v4106, v4107)
                if v4106.name.type == 3 then
                    v3915 = v3915 .. v4106.name.value;
                    return;
                elseif v4106.name.type == 4 then
                    v3921(v4106.name, v4107);
                    return;
                else
                    error("Corrupted global");
                    return;
                end;
            end, 
            name = function(v4108, v4109)
                local l_name_19 = v4108.name;
                local l_override_expr_23 = l_name_19.override_expr;
                if l_override_expr_23 then
                    v3919(l_override_expr_23, v4109);
                    return;
                else
                    v3915 = v3915 .. l_name_19.name;
                    return;
                end;
            end, 
            varargs = function(_, _)
                v3915 = v3915 .. "...";
            end, 
            ["nil"] = function(_, _)
                v3915 = v3915 .. "nil";
            end, 
            boolean = function(v4116, _)
                v3915 = v3915 .. (v4116.value and "true" or "false");
            end, 
            ["new table"] = function(v4118, v4119)
                local l_initializers_1 = v4118.initializers;
                local v4121 = true;
                for _ in pairs(l_initializers_1) do
                    v4121 = false;
                    break;
                end;
                if v4121 then
                    v3915 = v3915 .. "{}";
                else
                    v3915 = v3915 .. "{";
                    local v4123 = table.maxn(l_initializers_1);
                    local v4124 = false;
                    if v1129.always_use_table_keys then
                        v4124 = true;
                    else
                        for v4125 in pairs(l_initializers_1) do
                            if type(v4125) ~= "number" then
                                v4124 = true;
                                break;
                            end;
                        end;
                    end;
                    local l_v4124_0 = v4124;
                    local l_v4119_0 = v4119;
                    if l_v4124_0 then
                        v4119 = string.rep(v3916, #v4119 / #v3916 + 1);
                        v3915 = v3915 .. "\n" .. v4119;
                    end;
                    local l_initializers_order_0 = v4118.initializers_order;
                    local v4129 = #l_initializers_order_0;
                    for v4130, v4131 in ipairs(l_initializers_order_0) do
                        local v4132 = l_initializers_1[v4131];
                        if type(v4131) == "table" then
                            if v1129.table_string_key_shortening and v4131.t == "constant" and v4131.const.type == 3 and v538(v4131.const.value) then
                                v3915 = v3915 .. v4131.const.value .. " = ";
                            else
                                v3915 = v3915 .. "[";
                                v3919(v4131, v4119);
                                v3915 = v3915 .. "] = ";
                            end;
                            v3919(v4132, v4119);
                            if v1129.table_dict_key_semicolons then
                                v3915 = v3915 .. ";";
                            else
                                v3915 = v3915 .. ",";
                            end;
                            if v4130 ~= v4129 then
                                v3915 = v3915 .. "\n" .. v4119;
                            end;
                        elseif v1129.always_use_table_keys then
                            v3915 = v3915 .. "[" .. v4131 .. "] = ";
                            v3919(v4132, v4119);
                            if v1129.table_dict_key_semicolons then
                                v3915 = v3915 .. ";";
                            else
                                v3915 = v3915 .. ",";
                            end;
                            if v4130 ~= v4129 then
                                v3915 = v3915 .. "\n" .. v4119;
                            end;
                        end;
                        if #v3915 > 20 then
                            v3923 = v3923 + #v3915;
                            table.insert(v3922, v3915);
                            v3915 = "";
                        end;
                    end;
                    if not v1129.always_use_table_keys then
                        if v4124 and v4123 > 0 then
                            v3915 = v3915 .. "\n" .. v4119;
                        end;
                        for v4133 = 1, v4123 do
                            if not (v4133 % 10 == 0) or l_v4124_0 then

                            end;
                            v3919(l_initializers_1[v4133], v4119);
                            if v4133 < v4123 then
                                if v1129.table_array_value_semicolons then
                                    v3915 = v3915 .. "; ";
                                else
                                    v3915 = v3915 .. ", ";
                                end;
                            end;
                            if #v3915 > 20 then
                                v3923 = v3923 + #v3915;
                                table.insert(v3922, v3915);
                                v3915 = "";
                            end;
                        end;
                    end;
                    v4119 = l_v4119_0;
                    if l_v4124_0 then
                        v3915 = v3915 .. "\n" .. v4119;
                    end;
                    v3915 = v3915 .. "}";
                end;
                if #v3915 > 20 then
                    v3923 = v3923 + #v3915;
                    table.insert(v3922, v3915);
                    v3915 = "";
                end;
            end, 
            constant = function(v4134, v4135)
                v3921(v4134.const, v4135);
            end, 
            call = v4105.call, 
            ["constant index"] = function(v4136, v4137)
                v3919(v4136.table, v4137);
                if v4136.index.type == 3 and v538(v4136.index.value) then
                    if v4136.namecall then
                        v3915 = v3915 .. ":" .. v4136.index.value;
                        return;
                    else
                        v3915 = v3915 .. "." .. v4136.index.value;
                        return;
                    end;
                else
                    if v4136.namecall then
                        v3915 = v3915 .. "--[[Namecall requested, but namecall method is an invalid name]]";
                    end;
                    v3915 = v3915 .. "[";
                    v3921(v4136.index, v4137);
                    v3915 = v3915 .. "]";
                    return;
                end;
            end, 
            ["function"] = function(v4138, v4139)
                v3915 = v3915 .. "function(";
                v3947(v4138, v4139);
                v3915 = v3915 .. ")";
                local v4140 = " -- ";
                local l_line_defined_2 = v4138.line_defined;
                if l_line_defined_2 then
                    if l_line_defined_2 == -1 then
                        v3915 = v3915 .. " -- Internal function, doesn't exist in bytecode";
                        v4140 = ", ";
                    elseif v1129.show_proto_line_defined then
                        v3915 = v3915 .. " -- Line " .. l_line_defined_2;
                        v4140 = ", ";
                    end;
                end;
                if v4138.name_known and v4138.name ~= nil then
                    v3915 = v3915 .. v4140 .. "Named \"" .. v4138.name .. "\"";
                end;
                v3915 = v3915 .. "\n";
                v3923 = v3923 + #v3915;
                table.insert(v3922, v3915);
                v3915 = "";
                v3976(v4138, v4139);
                v3915 = v3915 .. v4139 .. "end";
            end, 
            ["and"] = function(v4142, v4143)
                local l_v3919_0 = v3919;
                local l_lhs_4 = v4142.lhs;
                local l_v4143_0 = v4143;
                local l_lhs_5 = v4142.lhs;
                l_v3919_0(l_lhs_4, l_v4143_0, (l_lhs_5 and l_lhs_5.precedence or -100) > (v4142 and v4142.precedence or -100));
                v3915 = v3915 .. " and ";
                l_v3919_0 = v3919;
                l_lhs_4 = v4142.rhs;
                l_v4143_0 = v4143;
                l_lhs_5 = v4142.rhs;
                l_v3919_0(l_lhs_4, l_v4143_0, (l_lhs_5 and l_lhs_5.precedence or -100) > (v4142 and v4142.precedence or -100));
            end, 
            ["or"] = function(v4148, v4149)
                local l_v3919_1 = v3919;
                local l_lhs_6 = v4148.lhs;
                local l_v4149_0 = v4149;
                local l_lhs_7 = v4148.lhs;
                l_v3919_1(l_lhs_6, l_v4149_0, (l_lhs_7 and l_lhs_7.precedence or -100) > (v4148 and v4148.precedence or -100));
                v3915 = v3915 .. " or ";
                l_v3919_1 = v3919;
                l_lhs_6 = v4148.rhs;
                l_v4149_0 = v4149;
                l_lhs_7 = v4148.rhs;
                l_v3919_1(l_lhs_6, l_v4149_0, (l_lhs_7 and l_lhs_7.precedence or -100) > (v4148 and v4148.precedence or -100));
            end, 
            condition = function(v4154, v4155)
                local l_v3919_2 = v3919;
                local l_lhs_8 = v4154.lhs;
                local l_v4155_0 = v4155;
                local l_lhs_9 = v4154.lhs;
                l_v3919_2(l_lhs_8, l_v4155_0, (l_lhs_9 and l_lhs_9.precedence or -100) > (v4154 and v4154.precedence or -100));
                v3915 = v3915 .. " " .. v4154.condition .. " ";
                l_v3919_2 = v3919;
                l_lhs_8 = v4154.rhs;
                l_v4155_0 = v4155;
                l_lhs_9 = v4154.rhs;
                l_v3919_2(l_lhs_8, l_v4155_0, (l_lhs_9 and l_lhs_9.precedence or -100) > (v4154 and v4154.precedence or -100));
            end, 
            addition = function(v4160, v4161)
                local l_v3919_3 = v3919;
                local l_lhs_10 = v4160.lhs;
                local l_v4161_0 = v4161;
                local v4165 = true;
                local l_lhs_11 = v4160.lhs;
                if (l_lhs_11 and l_lhs_11.precedence or -100) <= (v4160 and v4160.precedence or -100) then
                    v4165 = true;
                    if v4160.rhs.t ~= "addition" then
                        v4165 = v4160.rhs.t == "subtraction";
                    end;
                end;
                l_v3919_3(l_lhs_10, l_v4161_0, v4165);
                v3915 = v3915 .. " + ";
                l_v3919_3 = v3919;
                l_lhs_10 = v4160.rhs;
                l_v4161_0 = v4161;
                v4165 = true;
                l_lhs_11 = v4160.rhs;
                if (l_lhs_11 and l_lhs_11.precedence or -100) <= (v4160 and v4160.precedence or -100) then
                    v4165 = true;
                    if v4160.rhs.t ~= "addition" then
                        v4165 = v4160.rhs.t == "subtraction";
                    end;
                end;
                l_v3919_3(l_lhs_10, l_v4161_0, v4165);
            end, 
            subtraction = function(v4167, v4168)
                local l_v3919_4 = v3919;
                local l_lhs_12 = v4167.lhs;
                local l_v4168_0 = v4168;
                local v4172 = true;
                local l_lhs_13 = v4167.lhs;
                if (l_lhs_13 and l_lhs_13.precedence or -100) <= (v4167 and v4167.precedence or -100) then
                    v4172 = true;
                    if v4167.rhs.t ~= "addition" then
                        v4172 = v4167.rhs.t == "subtraction";
                    end;
                end;
                l_v3919_4(l_lhs_12, l_v4168_0, v4172);
                v3915 = v3915 .. " - ";
                l_v3919_4 = v3919;
                l_lhs_12 = v4167.rhs;
                l_v4168_0 = v4168;
                v4172 = true;
                l_lhs_13 = v4167.rhs;
                if (l_lhs_13 and l_lhs_13.precedence or -100) <= (v4167 and v4167.precedence or -100) then
                    v4172 = true;
                    if v4167.rhs.t ~= "addition" then
                        v4172 = v4167.rhs.t == "subtraction";
                    end;
                end;
                l_v3919_4(l_lhs_12, l_v4168_0, v4172);
            end, 
            multiplication = function(v4174, v4175)
                local l_v3919_5 = v3919;
                local l_lhs_14 = v4174.lhs;
                local l_v4175_0 = v4175;
                local v4179 = true;
                local l_lhs_15 = v4174.lhs;
                if (l_lhs_15 and l_lhs_15.precedence or -100) <= (v4174 and v4174.precedence or -100) then
                    v4179 = true;
                    if v4174.rhs.t ~= "multiplication" then
                        v4179 = v4174.rhs.t == "division";
                    end;
                end;
                l_v3919_5(l_lhs_14, l_v4175_0, v4179);
                v3915 = v3915 .. " * ";
                l_v3919_5 = v3919;
                l_lhs_14 = v4174.rhs;
                l_v4175_0 = v4175;
                v4179 = true;
                l_lhs_15 = v4174.rhs;
                if (l_lhs_15 and l_lhs_15.precedence or -100) <= (v4174 and v4174.precedence or -100) then
                    v4179 = true;
                    if v4174.rhs.t ~= "multiplication" then
                        v4179 = v4174.rhs.t == "division";
                    end;
                end;
                l_v3919_5(l_lhs_14, l_v4175_0, v4179);
            end, 
            division = function(v4181, v4182)
                local l_v3919_6 = v3919;
                local l_lhs_16 = v4181.lhs;
                local l_v4182_0 = v4182;
                local v4186 = true;
                local l_lhs_17 = v4181.lhs;
                if (l_lhs_17 and l_lhs_17.precedence or -100) <= (v4181 and v4181.precedence or -100) then
                    v4186 = true;
                    if v4181.rhs.t ~= "multiplication" then
                        v4186 = v4181.rhs.t == "division";
                    end;
                end;
                l_v3919_6(l_lhs_16, l_v4182_0, v4186);
                v3915 = v3915 .. " / ";
                l_v3919_6 = v3919;
                l_lhs_16 = v4181.rhs;
                l_v4182_0 = v4182;
                v4186 = true;
                l_lhs_17 = v4181.rhs;
                if (l_lhs_17 and l_lhs_17.precedence or -100) <= (v4181 and v4181.precedence or -100) then
                    v4186 = true;
                    if v4181.rhs.t ~= "multiplication" then
                        v4186 = v4181.rhs.t == "division";
                    end;
                end;
                l_v3919_6(l_lhs_16, l_v4182_0, v4186);
            end, 
            ["floor division"] = function(v4188, v4189)
                local l_v3919_7 = v3919;
                local l_lhs_18 = v4188.lhs;
                local l_v4189_0 = v4189;
                local l_lhs_19 = v4188.lhs;
                l_v3919_7(l_lhs_18, l_v4189_0, (l_lhs_19 and l_lhs_19.precedence or -100) > (v4188 and v4188.precedence or -100));
                v3915 = v3915 .. " // ";
                l_v3919_7 = v3919;
                l_lhs_18 = v4188.rhs;
                l_v4189_0 = v4189;
                l_lhs_19 = v4188.rhs;
                l_v3919_7(l_lhs_18, l_v4189_0, (l_lhs_19 and l_lhs_19.precedence or -100) > (v4188 and v4188.precedence or -100));
            end, 
            modulus = function(v4194, v4195)
                local l_v3919_8 = v3919;
                local l_lhs_20 = v4194.lhs;
                local l_v4195_0 = v4195;
                local l_lhs_21 = v4194.lhs;
                l_v3919_8(l_lhs_20, l_v4195_0, (l_lhs_21 and l_lhs_21.precedence or -100) > (v4194 and v4194.precedence or -100));
                v3915 = v3915 .. " % ";
                l_v3919_8 = v3919;
                l_lhs_20 = v4194.rhs;
                l_v4195_0 = v4195;
                l_lhs_21 = v4194.rhs;
                l_v3919_8(l_lhs_20, l_v4195_0, (l_lhs_21 and l_lhs_21.precedence or -100) > (v4194 and v4194.precedence or -100));
            end, 
            negate = function(v4200, v4201)
                v3915 = v3915 .. "-";
                local l_v3919_9 = v3919;
                local l_rhs_9 = v4200.rhs;
                local l_v4201_0 = v4201;
                local l_rhs_10 = v4200.rhs;
                l_v3919_9(l_rhs_9, l_v4201_0, (l_rhs_10 and l_rhs_10.precedence or -100) >= (v4200 and v4200.precedence or -100));
            end, 
            ["not"] = function(v4206, v4207)
                v3915 = v3915 .. "not ";
                local l_v3919_10 = v3919;
                local l_rhs_11 = v4206.rhs;
                local l_v4207_0 = v4207;
                local l_rhs_12 = v4206.rhs;
                l_v3919_10(l_rhs_11, l_v4207_0, (l_rhs_12 and l_rhs_12.precedence or -100) > (v4206 and v4206.precedence or -100));
            end, 
            length = function(v4212, v4213)
                v3915 = v3915 .. "#";
                local l_v3919_11 = v3919;
                local l_rhs_13 = v4212.rhs;
                local l_v4213_0 = v4213;
                local l_rhs_14 = v4212.rhs;
                l_v3919_11(l_rhs_13, l_v4213_0, (l_rhs_14 and l_rhs_14.precedence or -100) >= (v4212 and v4212.precedence or -100));
            end, 
            concatenation = function(v4218, v4219)
                for v4220, v4221 in ipairs(v4218.exprs) do
                    if v4220 > 1 then
                        v3915 = v3915 .. "..";
                    end;
                    v3919(v4221, v4219, (v4218 and v4218.precedence or -100) < (v4221 and v4221.precedence or -100));
                end;
            end, 
            exponentiation = function(v4222, v4223)
                local l_v3919_12 = v3919;
                local l_lhs_22 = v4222.lhs;
                local l_v4223_0 = v4223;
                local l_lhs_23 = v4222.lhs;
                l_v3919_12(l_lhs_22, l_v4223_0, (l_lhs_23 and l_lhs_23.precedence or -100) > (v4222 and v4222.precedence or -100));
                v3915 = v3915 .. " ^ ";
                l_v3919_12 = v3919;
                l_lhs_22 = v4222.rhs;
                l_v4223_0 = v4223;
                l_lhs_23 = v4222.rhs;
                l_v3919_12(l_lhs_22, l_v4223_0, (l_lhs_23 and l_lhs_23.precedence or -100) > (v4222 and v4222.precedence or -100));
            end, 
            ["get table"] = function(v4228, v4229)
                local l_table_3 = v4228.table;
                while l_table_3.t == "name" do
                    local l_override_expr_24 = l_table_3.name.override_expr;
                    if l_override_expr_24 then
                        l_table_3 = l_override_expr_24;
                    else
                        break;
                    end;
                end;
                local l_l_table_3_0 = l_table_3;
                l_table_3 = v3919;
                local l_l_l_table_3_0_0 = l_l_table_3_0;
                local l_v4229_0 = v4229;
                local v4235 = true;
                if l_l_table_3_0.t ~= "new table" then
                    v4235 = (l_l_table_3_0 and l_l_table_3_0.precedence or -100) >= 0;
                end;
                l_table_3(l_l_l_table_3_0_0, l_v4229_0, v4235);
                if v4228.index.t == "constant" and v4228.index.const.type == 3 and v538(v4228.index.const.value) then
                    v3915 = v3915 .. "." .. v4228.index.const.value;
                    return;
                else
                    v3915 = v3915 .. "[";
                    v3919(v4228.index, v4229);
                    v3915 = v3915 .. "]";
                    return;
                end;
            end
        };
        v523 = v1129.do_tonumber_nan;
        v3921 = function(v4237, v4238)
            local l_type_13 = v4237.type;
            if l_type_13 == 0 then
                v3915 = v3915 .. "nil";
                return;
            elseif l_type_13 == 1 then
                v3915 = v3915 .. (v4237.value and "true" or "false");
                return;
            elseif l_type_13 == 3 then
                local l_value_15 = v4237.value;
                local v4241 = v1332[l_value_15];
                if v4241 then
                    v3915 = v3915 .. v4241;
                    return;
                else
                    v3923 = v3923 + #v3915;
                    table.insert(v3922, v3915);
                    v3915 = "";
                    v3915 = v3915 .. v460(v1129.string_quotes_behavior, l_value_15);
                    v3923 = v3923 + #v3915;
                    table.insert(v3922, v3915);
                    v3915 = "";
                    return;
                end;
            elseif l_type_13 == 2 then
                v3915 = v3915 .. v527(v4237.value);
                return;
            elseif l_type_13 == 7 then
                v3915 = v3915 .. "Vector3.new(" .. v527(v4237.value.X, true) .. ", " .. v527(v4237.value.Y, true) .. ", " .. v527(v4237.value.Z, true) .. ")";
                return;
            elseif l_type_13 == 4 then
                v3919(v4237.value, v4238);
                return;
            else
                error((("Unknown const type %*"):format(l_type_13)));
                return;
            end;
        end;
        local v4242 = string.sub(v3916, 1, 1);
        v3919 = function(v4243, v4244, v4245)
            local v4246 = v4236[v4243.t];
            if v4246 then
                if v4245 then
                    local v4247 = false;
                    if #v3922 > 1 then
                        local v4248 = true;
                        for v4249 = #v3915, 1, -1 do
                            if string.sub(v3915, v4249, v4249) ~= v4242 then
                                v4248 = false;
                                break;
                            end;
                        end;
                        if v4248 then
                            local v4250 = v3922[#v3922];
                            if v4250 then
                                for v4251 = #v4250, 1, -1 do
                                    local v4252 = string.sub(v4250, v4251, v4251);
                                    if v4252 ~= v4242 then
                                        if v4252 == "\n" then
                                            v4247 = true;
                                            break;
                                        else
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if v4247 then
                        v3915 = v3915 .. ";(";
                    else
                        v3915 = v3915 .. "(";
                    end;
                end;
                local l_status_0, l_result_0 = pcall(v4246, v4243, v4244);
                if not l_status_0 then
                    v4105.comment(v1205(": First try: " .. l_result_0 .. "\n"), v4244);
                end;
                if v4245 then
                    v3915 = v3915 .. ")";
                    return;
                end;
            else
                error((("Unknown AST expr type \"%*\""):format(v4243.t)));
            end;
        end;
        v3920 = function(v4255, v4256)
            for _, v4258 in ipairs(v4255) do
                local v4259 = v4105[v4258.t];
                if v4259 then
                    if v4258.t ~= "nothing" then
                        v3915 = v3915 .. v4256;
                        v4259(v4258, v4256);
                        v3915 = v3915 .. "\n";
                        v3923 = v3923 + #v3915;
                        table.insert(v3922, v3915);
                        v3915 = "";
                    end;
                else
                    error((("Unknown AST line type \"%*\""):format(v4258.t)));
                end;
            end;
        end;
        local v4260 = table.create(#v3176);
        for _, v4262 in ipairs(v3176) do
            if v4262.t ~= "nothing" then
                if not v4262.t then
                    print(v4262);
                end;
                table.insert(v4260, v4262);
            end;
        end;
        v3920(v4260, "");
        local v4263 = l_clock_0() - v1127;
        local v4264 = 2;
        local function v4267(v4265)
            local l_v4264_0 = v4264;
            v3923 = v3923 + #v4265;
            table.insert(v3922, l_v4264_0, v4265);
            v4264 = v4264 + 1;
        end;
        v4267((("-- Time taken: %* seconds\n"):format((string.format("%.6f", v4263)))));
        if #v1142 > 0 then
            v4267("\n");
            local v4268 = {};
            local v4269 = {};
            local v4270 = {};
            local v4271 = {};
            local v4272 = {};
            local v4273 = {};
            local l_v4271_0 = v4271 --[[ copy: 146 -> 155 ]];
            local l_v4268_0 = v4268 --[[ copy: 143 -> 156 ]];
            local l_v4272_0 = v4272 --[[ copy: 147 -> 157 ]];
            local l_v4269_0 = v4269 --[[ copy: 144 -> 158 ]];
            local l_v4273_0 = v4273 --[[ copy: 148 -> 159 ]];
            local l_v4270_0 = v4270 --[[ copy: 145 -> 160 ]];
            local function v4280(v4281, v4282)
                if v4281 == "error" then
                    local v4283 = l_v4271_0[v4282];
                    if v4283 then
                        v4283.uses = v4283.uses + 1;
                        return;
                    else
                        local v4284 = {
                            uses = 1, 
                            content = v4282
                        };
                        l_v4271_0[v4282] = v4284;
                        table.insert(l_v4268_0, v4284);
                        return;
                    end;
                elseif v4281 == "warning" then
                    local v4285 = l_v4272_0[v4282];
                    if v4285 then
                        v4285.uses = v4285.uses + 1;
                        return;
                    else
                        local v4286 = {
                            uses = 1, 
                            content = v4282
                        };
                        l_v4272_0[v4282] = v4286;
                        table.insert(l_v4269_0, v4286);
                        return;
                    end;
                elseif v4281 == "info" then
                    local v4287 = l_v4273_0[v4282];
                    if v4287 then
                        v4287.uses = v4287.uses + 1;
                        return;
                    else
                        local v4288 = {
                            uses = 1, 
                            content = v4282
                        };
                        l_v4273_0[v4282] = v4288;
                        table.insert(l_v4270_0, v4288);
                        return;
                    end;
                else
                    v4280("error", (("Unknown notice type \"%*\""):format(v4281)));
                    return;
                end;
            end;
            for _, v4290 in ipairs(v1142) do
                v4280(v4290.type, v4290.content);
            end;
            local function v4308(v4291, v4292, v4293)
                if #v4293 > 0 then
                    local v4294 = "-- " .. v4291 .. "[" .. #v4293 .. "]:\n";
                    local l_v4264_1 = v4264;
                    v3923 = v3923 + #v4294;
                    table.insert(v3922, l_v4264_1, v4294);
                    v4264 = v4264 + 1;
                    for v4296, v4297 in ipairs(v4293) do
                        local l_uses_0 = v4297.uses;
                        local l_content_0 = v4297.content;
                        if string.match(l_content_0, "\n") then
                            if l_uses_0 == 1 then
                                local v4300 = "--[[ " .. v4296 .. ". " .. v4292 .. ":\n" .. l_content_0 .. "\n]]\n";
                                local l_v4264_2 = v4264;
                                v3923 = v3923 + #v4300;
                                table.insert(v3922, l_v4264_2, v4300);
                                v4264 = v4264 + 1;
                            else
                                local v4302 = "--[[ " .. v4296 .. ". " .. v4292 .. " [x" .. l_uses_0 .. "]:n" .. l_content_0 .. "\n]]\n";
                                local l_v4264_3 = v4264;
                                v3923 = v3923 + #v4302;
                                table.insert(v3922, l_v4264_3, v4302);
                                v4264 = v4264 + 1;
                            end;
                        elseif l_uses_0 == 1 then
                            local v4304 = "---- " .. v4296 .. ". " .. v4292 .. ": " .. l_content_0 .. "\n";
                            local l_v4264_4 = v4264;
                            v3923 = v3923 + #v4304;
                            table.insert(v3922, l_v4264_4, v4304);
                            v4264 = v4264 + 1;
                        else
                            local v4306 = "---- " .. v4296 .. ". " .. v4292 .. " [x" .. l_uses_0 .. "]: " .. l_content_0 .. "\n";
                            local l_v4264_5 = v4264;
                            v3923 = v3923 + #v4306;
                            table.insert(v3922, l_v4264_5, v4306);
                            v4264 = v4264 + 1;
                        end;
                    end;
                end;
            end;
            v4308("Global Errors", l_prefix_error_1, v4268);
            v4308("Global Warnings", l_prefix_warning_1, v4269);
            v4308("Global Information", l_prefix_information_1, v4270);
        end;
        v4267("\n");
        for _, v4310 in ipairs(v1333) do
            if v1129.mark_reads_and_writes then
                v4267("-- " .. v3981("Variable", v1334[v4310], 1, true) .. "\n");
            end;
            v4267("local " .. v1332[v4310] .. " = ");
            v4267(v460(v1129.string_quotes_behavior, v4310));
            v4267("\n");
        end;
        v1128:end_benchmark("Global AST To String");
        v1128:start_benchmark("Global String Writing");
        local v4311 = buffer.create(v3923);
        local v4312 = 0;
        for _, v4314 in ipairs(v3922) do
            buffer.copy(v4311, v4312, buffer.fromstring(v4314));
            v4312 = v4312 + #v4314;
        end;
        while buffer.readu8(v4311, buffer.len(v4311) - 1) == 10 do
            local v4315 = buffer.len(v4311) - 1;
            local v4316 = buffer.create(v4315);
            buffer.copy(v4316, 0, v4311, 0, v4315);
            v4311 = v4316;
        end;
        local v4317 = buffer.tostring(v4311);
        v1128:end_benchmark("Global String Writing");
        v1128:print_all_times();
        return v4317;
    end;
end;
local function _(v4319, v4320)
    local function v4322(v4321)
        if type(v4321) == "string" then
            return v4319(v4321);
        else
            assert(l_getscriptbytecode_0, "getscriptbytecode was undefined");
            return v4319(l_getscriptbytecode_0(v4321));
        end;
    end;
    if v4320 then
        return function(...)
            local v4324, v4325 = xpcall(v4322, function(v4323)
                return tostring(v4323) .. "\n" .. debug.traceback(nil, 2);
            end, ...);
            if v4324 then
                return v4325;
            else
                return l_prefix_error_0 .. ": After: " .. v4325;
            end;
        end;
    else
        return v4322;
    end;
end;
local function v4328(v4327)
    if type(v4327) == "string" then
        return v4318(v4327);
    else
        assert(l_getscriptbytecode_0, "getscriptbytecode was undefined");
        return v4318(l_getscriptbytecode_0(v4327));
    end;
end;
local l_v4328_0 = v4328 --[[ copy: 105 -> 109 ]];
local function v4333(...)
    local v4331, v4332 = xpcall(l_v4328_0, function(v4330)
        return tostring(v4330) .. "\n" .. debug.traceback(nil, 2);
    end, ...);
    if v4331 then
        return v4332;
    else
        return l_prefix_error_0 .. ": After: " .. v4332;
    end;
end;
v4328 = function(v4334)
    v16 = "vanilla";
    local v4335 = v4333(v4334);
    local l_v551_0 = v551;
    v16 = "mul227";
    local v4337 = v4333(v4334);
    local l_v551_1 = v551;
    if l_v551_1 < l_v551_0 then
        return v4337;
    elseif l_v551_0 < l_v551_1 then
        return v4335;
    elseif string.match(v4335, "Unknown opcode") then
        return v4337;
    else
        return v4335;
    end;
end;
local function v4340(v4339)
    if type(v4339) == "string" then
        return v1121(v4339);
    else
        assert(l_getscriptbytecode_0, "getscriptbytecode was undefined");
        return v1121(l_getscriptbytecode_0(v4339));
    end;
end;
local function v4344(...)
    local v4342, v4343 = xpcall(v4340, function(v4341)
        return tostring(v4341) .. "\n" .. debug.traceback(nil, 2);
    end, ...);
    if v4342 then
        return v4343;
    else
        return l_prefix_error_0 .. ": After: " .. v4343;
    end;
end;
return {
    decompile = v4328, 
    disassemble = function(v4345)
        v16 = "vanilla";
        local v4346 = v4344(v4345);
        local l_v551_2 = v551;
        v16 = "mul227";
        local v4348 = v4344(v4345);
        local l_v551_3 = v551;
        if l_v551_3 < l_v551_2 then
            return v4348;
        elseif l_v551_2 < l_v551_3 then
            return v4346;
        elseif #v4348 >= #v4346 then
            return v4348;
        else
            return v4346;
        end;
    end
};
