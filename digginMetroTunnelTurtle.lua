local tunnelCounter = 0
local tunnelLength = 0

turtle.select(1)
local modem = peripheral.find("modem", rednet.open)
local id, message, protocol = rednet.receive()
print(message)
if message == "tunnel" then
    rednet.send(1, "For how long?")
end

local id, tunnelLength, protocol = rednet.receive()
tunnelLength = tonumber(tunnelLength)

function detectAndPlaceDown()
    if not turtle.detectDown() then
        turtle.select(5)
        turtle.placeDown()
    end
end

function detectAndPlaceForward()
    if not turtle.detect() then
        turtle.select(4)
        turtle.place()
    end
end

function detectAndPlaceUp()
    if not turtle.detectUp() then
        turtle.select(4)
        turtle.placeUp()
    end
end

function turtleDigging()
    tunnelCounter = tunnelCounter + 1
    turtle.dig()
    turtle.forward()
    detectAndPlaceDown()
    turtle.turnLeft()
    detectAndPlaceForward()
    turtle.turnRight()
    turtle.turnRight()
    for i = 1, 6 do
        for j = 1, 4 do
            turtle.dig()
            turtle.forward()
            if i == 1 then
                detectAndPlaceDown()
                if j == 4 and tunnelCounter == 1 then
                    tunnelCounter = 0
                    turtle.select(6)
                    turtle.turnRight()
                    turtle.place()
                    turtle.turnLeft()
                end
            end
        end
        detectAndPlaceForward()
        if i == 6 then
            break
        end
        turtle.digUp()
        turtle.up()
        detectAndPlaceForward()
        turtle.turnRight()
        turtle.turnRight()
    end

    detectAndPlaceForward()
    turtle.turnRight()
    turtle.turnRight()
    detectAndPlaceUp()
    turtle.forward()
    turtle.digUp()
    turtle.up()
    detectAndPlaceUp()
    for i = 1, 2 do
        turtle.dig()
        turtle.forward()
        detectAndPlaceUp()
    end

    detectAndPlaceForward()

    for i = 1, 7 do
        turtle.down()
    end

    turtle.turnRight()
    turtle.turnRight()
    for i = 1, 3 do
        turtle.forward()
    end
    turtle.turnRight()

    if tunnelCounter == 1 then
        tunnelCounter = 0
        turtle.select(6)
        turtle.turnRight()
        turtle.turnRight()
        turtle.place()
        turtle.turnRight()
        turtle.turnRight()
    end
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

if tunnelLength ~= 0 then
    for i = 1, tunnelLength do
        turtleDigging()
    end
end
