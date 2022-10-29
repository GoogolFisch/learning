log    = require("logger")
json   = require("json")
keys   = {}
data   = {}
function getArgs()
    for k,v in pairs(args) do
        if k > 0 and string.sub(v,1,1) == "-" then
            keys[string.sub(v,2,-1)] = true
        elseif k > 0 then
            table.insert(data,v)
        end
    end
end

function getInfo(tab)
    local out = ""
    for k,v in pairs(tab) do
        out = out .. (string.len(out) > 0 and " | " or "") .. v
    end
    return out
end

function dataTesting(realData)
    count  =         (keys["5" ] and  5 or 0)
    count  = count + (keys["10"] and 10 or 0)
    count  = count + (keys["20"] and 20 or 0)
    count  = count + (keys["35"] and 35 or 0)

    local tableing = realData["dic"]
    local voc = 0
    local thi = 0
    local ans = ""

    for x=0,count,1 do
        voc = 1 + math.floor(math.random() * #tableing     )
        thi = 1 + math.floor(math.random() * #tableing[voc])

        print(tableing[voc][thi])
        ans = io.read()
        print(getInfo(tableing[voc]))
    end
end

function main()
    logger = log.init()
    getArgs()
    local learnPath = data[2] or ""
    if keys["l1"] then
        logger:log(args)
        logger:log(keys)
        logger:log(data)
        logger:log(_G,nil,1)
    end
    local file = io.open(learnPath)
    if file ~= nil then
        local data = file:read("*a")
        io.close(file)
        dataTesting(json.decode(data))
    end
end

main()