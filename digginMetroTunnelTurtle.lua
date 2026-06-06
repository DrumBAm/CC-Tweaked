function turtleDigging()
    for i = 1, 6 do
        turtle.up()
        turtle.dig()
    end
    for i = 1, 3 do
        turtle.turnRight()
        turtle.forward()
        turtle.turnLeft()
        turtle.dig()
    end
    turtle.down()
    turtle.dig()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    for i = 1, 6 do
        turtle.dig()
        if i ~= 6 then
            turtle.down()
        end
    end
    for i = 1, 3 do
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
        turtle.dig()
    end
    for i = 1, 4 do
        turtle.up()
        turtle.dig()
    end
    for i = 1, 2 do
        turtle.turnRight()
        turtle.forward()
        turtle.turnLeft()
        turtle.dig()
    end
    for i = 1, 3 do
        turtle.dig()
        if i ~= 3 then
            turtle.down()
        end
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.dig()
    for i = 1, 2 do
        turtle.up()
        turtle.dig()
    end
    for i = 1, 4 do
        turtle.down()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
end

turtle.select(1)
turtle.equipLeft()
turtle.select(2)
turtle.equipRight()
turtle.select(3)
turtle.refuel(64)
turtle.select(1)
local modem = peripheral.find("modem", rednet.open)
local id, message, protocol = rednet.receive()
print(message)
if message == "tunnel" then
    rednet.send(1, "For how long?")
end

message = 0;
local id, message, protocol = rednet.receive()
message = tonumber(message)
if message ~= 0 then
    for i = 1, message do

    end
end
