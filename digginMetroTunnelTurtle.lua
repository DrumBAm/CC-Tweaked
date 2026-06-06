function turtleDigging()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
    for i = 1, 4 do
        turtle.digUp()
        turtle.dig()
        turtle.forward()
    end

    turtle.digUp()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.up()
    turtle.digUp()
    turtle.up()

    for i = 1, 4 do
        turtle.digUp()
        turtle.dig()
        turtle.forward()
    end

    turtle.digUp()
    turtle.turnRight()
    turtle.turnRight()
    turtle.up()
    turtle.digUp()
    turtle.up()

    for i = 1, 4 do
        turtle.digUp()
        turtle.dig()
        turtle.forward()
    end

    turtle.digUp()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.up()
    turtle.digUp()
    turtle.up()

    for i = 1, 4 do
        turtle.digUp()
        turtle.dig()
        turtle.forward()
    end

    turtle.turnLeft()
    turtle.turnLeft()
    for i = 1, 3 do
        turtle.forward()
        turtle.digUp()
    end

    for i = 1, 6 do
        turtle.down()
    end
    turtle.forward()
    turtle.turnRight()
end

turtle.select(1)
if turtle.getEquippedLeft() == nil then
    turtle.equipLeft()
end
turtle.select(2)
if turtle.getEquippedRight() == nil then
    turtle.equipRight()
end
if turtle.getFuelLevel() == 0 then
    print("No fuel, refueling...")
    turtle.select(3)
    turtle.refuel(64)
end
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
        turtleDigging()
    end
end
