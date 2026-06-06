local modem = peripheral.find("modem", rednet.open)
print("Do you want to start digging?(y/n)")
local input = read()
if input == "y" then
    rednet.send(2, "tunnel")
else
    exit()
end

local id, message, protocol = rednet.receive()
print(message)
input = read()
rednet.send(2, input)
