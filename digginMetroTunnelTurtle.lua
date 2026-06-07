local tunnelCounter = 0
local tunnelLength = 0
local message = nil
local x = 0
local y = 0
local z = 0
local _ = nil
local xFinal = 0
local yFinal = 0
local zFinal = 0
local xDiff = 0
local yDiff = 0
local zDiff = 0
local directionMatrix = {
    ["x+"] = 1,
    ["z+"] = 2,
    ["x-"] = 3,
    ["z-"] = 4
}
local direction = directionMatrix["z-"];



function turnLeft()
    turtle.turnLeft()
    direction = ((direction - 2) % 4) + 1
end

function turnAround()
    turnRight()
    turnRight()
    direction = ((direction + 1) % 4) + 1
end

function moveForward()
    moveForward()
    changeCoordinates()
end

function moveUp()
    turtle.up()
    y = y + 1
end

function moveDown()
    turtle.down()
    y = y - 1
end

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

function changeCoordinates()
    if direction == 1 then
        x = x + 1
    elseif direction == 3 then
        x = x - 1
    elseif direction == 2 then
        z = z + 1
    elseif direction == 4 then
        z = z - 1
    end
end

function moveForward()
    turtle.forward()
    changeCoordinates()
end

function turtleDigging()
    turtle.dig()
    moveForward()
    detectAndPlaceDown()
    turnLeft()
    detectAndPlaceForward()
    turnRight()
    turnRight()
    for i = 1, 6 do
        for j = 1, 4 do
            turtle.dig()
            moveForward()
            if i == 1 then
                detectAndPlaceDown()
            end
        end
        detectAndPlaceForward()
        if i == 6 then
            break
        end
        turtle.digUp()
        moveUp()
        detectAndPlaceForward()
        turnRight()
        turnRight()
    end

    detectAndPlaceForward()
    turnRight()
    turnRight()
    detectAndPlaceUp()
    moveForward()
    turtle.digUp()
    moveUp()
    detectAndPlaceUp()
    for i = 1, 2 do
        turtle.dig()
        moveForward()
        detectAndPlaceUp()
    end

    detectAndPlaceForward()

    for i = 1, 7 do
        moveDown()
    end

    turnRight()
    turnRight()
    for i = 1, 3 do
        moveForward()
    end
    turnRight()
end

turtle.select(1)
local modem = peripheral.find("modem", rednet.open)
_, message, _ = rednet.receive()
if message == "tunnel" then
    _, message, _ = rednet.receive()
    x = tonumber(message)
    _, message, _ = rednet.receive()
    y = tonumber(message)
    _, message, _ = rednet.receive()
    z = tonumber(message)
    _, message, _ = rednet.receive()
    xFinal = tonumber(message)
    _, message, _ = rednet.receive()
    yFinal = tonumber(message)
    _, message, _ = rednet.receive()
    zFinal = tonumber(message)
end

print("Turtle coordinates: " .. x .. " " .. y .. " " .. z)
print("Final destination coordinates: " .. xFinal .. " " .. yFinal .. " " .. zFinal)
xDiff = xFinal - x
yDiff = yFinal - y
zDiff = zFinal - z
if xDiff == 0 then
    if zDiff > 0 then
        direction = directionMatrix["z+"]
    else
        direction = directionMatrix["z-"]
    end
elseif zDiff == 0 then
    if xDiff > 0 then
        direction = directionMatrix["x+"]
    else
        direction = directionMatrix["x-"]
    end
else
    print("Wrong coordinates, exiting...")
    exit()
end

function turnRight()
    turtle.turnRight()
    direction = (direction % 4) + 1
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

print("Work is done")
print("Turtle coordinates: " .. x .. " " .. y .. " " .. z)
print("Final destination coordinates: " .. xFinal .. " " .. yFinal .. " " .. zFinal)
