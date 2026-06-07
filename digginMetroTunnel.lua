local x = 0
local y = 0
local z = 0
local xFinal = 0
local yFinal = 0
local zFinal = 0
local modem = peripheral.find("modem", rednet.open)
print("Do you want to start digging?(y/n)")
local input = read()
if input == "y" then
    rednet.send(2, "tunnel")
else
    return
end

print("Put X coordinate of the turtle")
x = toNumber(read())
print("Put Y coordinate of the turtle")
y = toNumber(read())
print("Put Z coordinate of the turtle")
z = toNumber(read())

print("Put X coordinate of the final destination")
xFinal = toNumber(read())
print("Put Y coordinate of the final destination")
yFinal = toNumber(read())
print("Put Z coordinate of the final destination")
zFinal = toNumber(read())
rednet.send(2, { x, y, z, xFinal, yFinal, zFinal })
