local modem = peripheral.find("modem", rednet.open)
print("Do you want to start digging?(y/n)")
local input = read()
if input == "y" then
    rednet.send(2, "tunnel")
else
    exit()
end

print("Put X coordinate of the turtle")
rednet.send(2, read())
print("Put Y coordinate of the turtle")
rednet.send(2, read())
print("Put Z coordinate of the turtle")
rednet.send(2, read())

print("Put X coordinate of the final destination")
rednet.send(2, read())
print("Put Y coordinate of the final destination")
rednet.send(2, read())
print("Put Z coordinate of the final destination")
rednet.send(2, read())
