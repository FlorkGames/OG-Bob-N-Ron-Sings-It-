local activeWindow = false

function onCreate()
    -- triggered when the lua file is started
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
end

function onDestroy()
    -- triggered when the lua file is ended (Song fade out finished)
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
end

function createWindow(title, body, button, icon, sound, x, y, w, h)
    if activeWindow == false then
        local widthbox = 256
        local heightbox = 96
        if w == nil then

        else
            widthbox = w
        end

        if h == nil then

        else
            heightbox = h
        end

        if sound == nil then

        else
            playSound('windows95/' .. sound, 1, 'messagesound')
        end

        createQuickBox('window', 0, 0, 256, 96, 'FFFFFF', 1)
        setProperty('window.color', getColorFromHex('C0C0C0'))
        if x == nil then
            screenCenter('window', 'x')
        else
            setProperty('window.x', x)
        end

        if y == nil then
            screenCenter('window', 'y')
        else
            setProperty('window.x', y)
        end

        createBorder('borderwin1', getProperty('window.x') + 1, getProperty('window.y') + 1,
            getProperty('window.width') - (1 * 2), getProperty('window.height') - (1 * 2), 1, 1, 'FFFFFF', '808080')
        createBorder('borderwin2', getProperty('window.x'), getProperty('window.y'), getProperty('window.width'),
            getProperty('window.height'), 1, 1, 'DFDFDF', '0A0A0A')

        createQuickBox('titlebar', getProperty('window.x') + 3, getProperty('window.y') + 3,
            getProperty('window.width') - (3 * 2), 20, 'FFFFFF', 1)

        createQuickBox('closebutton', (getProperty('titlebar.x') + getProperty('titlebar.width') - 16 - 2),
            (getProperty('titlebar.y') + getProperty('titlebar.height') - 14 - 3), 16, 14, 'FFFFFF', 1)
        setProperty('closebutton.color', getColorFromHex('C0C0C0'))
        createBorder('borderclosebutton1', getProperty('closebutton.x') + 1, getProperty('closebutton.y') + 1,
            getProperty('closebutton.width') - (1 * 2), getProperty('closebutton.height') - (1 * 2), 1, 1, 'FFFFFF',
            '808080')
        createBorder('borderclosebutton2', getProperty('closebutton.x'), getProperty('closebutton.y'),
            getProperty('closebutton.width'), getProperty('closebutton.height'), 1, 1, 'DFDFDF', '0A0A0A')

        createQuickBox('okbutton', (getProperty('window.x') + getProperty('window.width') - 75 - 11),
            (getProperty('window.y') + getProperty('window.height') - 23 - 11), 75, 23, 'FFFFFF', 1)
        setProperty('okbutton.color', getColorFromHex('C0C0C0'))
        createBorder('borderokbutton1', getProperty('okbutton.x') + 1, getProperty('okbutton.y') + 1,
            getProperty('okbutton.width') - (1 * 2), getProperty('okbutton.height') - (1 * 2), 1, 1, 'FFFFFF', '808080')
        createBorder('borderokbutton2', getProperty('okbutton.x'), getProperty('okbutton.y'),
            getProperty('okbutton.width'), getProperty('okbutton.height'), 1, 1, 'DFDFDF', '0A0A0A')

        createTextQuick('title', title, getProperty('titlebar.x'), getProperty('titlebar.y') + 2, 0, 'left', 11, 0, 1,
            '0x00000000')
        setTextFont('title', 'windows95/bold/MS Sans Serif Bold.ttf')
        addLuaText('title')

        if icon == nil then

        else

            makeLuaSprite('windowicon', 'windows95/' .. icon, getProperty('window.x') + 14, getProperty('window.y') + 33);
            setObjectCamera('windowicon', 'hud')
            setProperty('windowicon.antialiasing', false)
            addLuaSprite('windowicon', true)
        end

        createTextQuick('body', body, getProperty('window.x') + 9, getProperty('window.y') + 34, 0, 'left', 11, 0, 1,
            '0x00000000')
        setTextColor('body', '000000')
        setTextFont('body', 'windows95/norm/MS Sans Serif.ttf')
        addLuaText('body')

        if icon == nil then
            setProperty('body.x', getProperty('window.x') + 9)
            setProperty('body.y', getProperty('window.y') + 34)
        else
            setProperty('body.x', getProperty('windowicon.x') + getProperty('windowicon.width') + 8)
            setProperty('body.y', getProperty('window.y') + 34)
        end

        createTextQuick('buttonText', button, getProperty('okbutton.x') + (getProperty('okbutton.width') / 2),
            getProperty('okbutton.y') + 3, 0, 'left', 11, 0, 1, '0x00000000')
        setTextColor('buttonText', '000000')
        setTextFont('buttonText', 'windows95/norm/MS Sans Serif.ttf')
        setProperty('buttonText.x', getProperty('okbutton.x') + (getProperty('okbutton.width') / 2) -
            (getProperty('buttonText.width') / 2))
        addLuaText('buttonText')

        makeLuaSprite('closeicon', 'windows95/SEX', (getProperty('closebutton.x') + 4),
            (getProperty('closebutton.y') + 3));
        setObjectCamera('closeicon', 'hud')
        setProperty('closeicon.antialiasing', false)
        addLuaSprite('closeicon', true)

        setProperty('titlebar.color', getColorFromHex('000080'))

        activeWindow = true
    end
end

function onUpdate()
    if curStep == 1 then
        createWindow('Titlebar', 'Body text', 'OK', nil, 'chord', nil, nil, nil, nil)
    end
end

function onUpdatePost(elapsed)
    interSectMAW = pointIntersect(getMouseX('hud'), getMouseY('hud'), getProperty('titlebar.x'),
        getProperty('titlebar.y'), getProperty('titlebar.width'), getProperty('titlebar.height'))

    interSectMAB = pointIntersect(getMouseX('hud'), getMouseY('hud'), getProperty('closebutton.x'),
        getProperty('closebutton.y'), getProperty('closebutton.width'), getProperty('closebutton.height'))

    interSectMAOKB = pointIntersect(getMouseX('hud'), getMouseY('hud'), getProperty('okbutton.x'),
        getProperty('okbutton.y'), getProperty('okbutton.width'), getProperty('okbutton.height'))

    if interSectMAW and not interSectMAB then
        if mousePressed('left') then
            updateWindow()
        end
    end

    if interSectMAOKB then
        if mousePressed('left') then
            okButtonPress()
        elseif mouseReleased('left') then
            okButtonRelease()
            removeWindow()
        end
    else
        okButtonRelease()
    end

    if interSectMAB then
        if mousePressed('left') then
            closeButtonPress()
        elseif mouseReleased('left') then
            closeButtonRelease()
            removeWindow()
        end
    else
        closeButtonRelease()
    end

    mouseHudX = getMouseX('hud');
    mouseHudY = getMouseY('hud');
end

function okButtonPress()
    setProperty('buttonText.x', getProperty('okbutton.x') + (getProperty('okbutton.width') / 2) -
        (getProperty('buttonText.width') / 2) + 1)
    setProperty('buttonText.y', (getProperty('okbutton.y') + 3 + 1))

    setProperty('borderokbutton11.color', getColorFromHex('808080'))
    setProperty('borderokbutton12.color', getColorFromHex('FFFFFF'))
    setProperty('borderokbutton13.color', getColorFromHex('FFFFFF'))
    setProperty('borderokbutton14.color', getColorFromHex('808080'))

    setProperty('borderokbutton21.color', getColorFromHex('0A0A0A'))
    setProperty('borderokbutton22.color', getColorFromHex('DFDFDF'))
    setProperty('borderokbutton23.color', getColorFromHex('DFDFDF'))
    setProperty('borderokbutton24.color', getColorFromHex('0A0A0A'))
end

function okButtonRelease()
    setProperty('buttonText.x',
        getProperty('okbutton.x') + (getProperty('okbutton.width') / 2) - (getProperty('buttonText.width') / 2))
    setProperty('buttonText.y', (getProperty('okbutton.y') + 3))

    setProperty('borderokbutton11.color', getColorFromHex('FFFFFF'))
    setProperty('borderokbutton12.color', getColorFromHex('808080'))
    setProperty('borderokbutton13.color', getColorFromHex('808080'))
    setProperty('borderokbutton14.color', getColorFromHex('FFFFFF'))

    setProperty('borderokbutton21.color', getColorFromHex('DFDFDF'))
    setProperty('borderokbutton22.color', getColorFromHex('0A0A0A'))
    setProperty('borderokbutton23.color', getColorFromHex('0A0A0A'))
    setProperty('borderokbutton24.color', getColorFromHex('DFDFDF'))
end

function closeButtonPress()
    setProperty('borderclosebutton11.color', getColorFromHex('808080'))
    setProperty('borderclosebutton12.color', getColorFromHex('FFFFFF'))
    setProperty('borderclosebutton13.color', getColorFromHex('FFFFFF'))
    setProperty('borderclosebutton14.color', getColorFromHex('808080'))

    setProperty('borderclosebutton21.color', getColorFromHex('0A0A0A'))
    setProperty('borderclosebutton22.color', getColorFromHex('DFDFDF'))
    setProperty('borderclosebutton23.color', getColorFromHex('DFDFDF'))
    setProperty('borderclosebutton24.color', getColorFromHex('0A0A0A'))
end

function closeButtonRelease()
    setProperty('borderclosebutton11.color', getColorFromHex('FFFFFF'))
    setProperty('borderclosebutton12.color', getColorFromHex('808080'))
    setProperty('borderclosebutton13.color', getColorFromHex('808080'))
    setProperty('borderclosebutton14.color', getColorFromHex('FFFFFF'))

    setProperty('borderclosebutton21.color', getColorFromHex('DFDFDF'))
    setProperty('borderclosebutton22.color', getColorFromHex('0A0A0A'))
    setProperty('borderclosebutton23.color', getColorFromHex('0A0A0A'))
    setProperty('borderclosebutton24.color', getColorFromHex('DFDFDF'))
end

function removeWindow()
    if activeWindow == true then
        removeLuaSprite('window', true)
        removeLuaSprite('titlebar', true)
        removeLuaSprite('closebutton', true)
        removeLuaSprite('okbutton', true)
        removeLuaSprite('closeicon', true)
        removeLuaSprite('windowicon', true)
        removeLuaText('title', true)
        removeLuaText('body', true)
        removeLuaText('buttonText', true)
        for n = 1, 4 do
            removeLuaSprite('borderwin1' .. n, true)
            removeLuaSprite('borderwin2' .. n, true)
            removeLuaSprite('borderclosebutton1' .. n, true)
            removeLuaSprite('borderclosebutton2' .. n, true)
            removeLuaSprite('borderokbutton1' .. n, true)
            removeLuaSprite('borderokbutton2' .. n, true)
        end
        activeWindow = false
    end
end

function updateWindow()
    setProperty('window.x', getProperty('window.x') + getMouseX('hud') - mouseHudX)
    setProperty('window.y', getProperty('window.y') + getMouseY('hud') - mouseHudY)

    setProperty('titlebar.x', getProperty('window.x') + 3)
    setProperty('titlebar.y', getProperty('window.y') + 3)

    updateBORDERS('borderwin1', getProperty('window.x') + 1, getProperty('window.y') + 1)
    updateBORDERS('borderwin2', getProperty('window.x'), getProperty('window.y'))

    setProperty('closebutton.x', (getProperty('titlebar.x') + getProperty('titlebar.width') - 16 - 2))
    setProperty('closebutton.y', (getProperty('titlebar.y') + getProperty('titlebar.height') - 14 - 3))

    setProperty('title.x', getProperty('titlebar.x'))
    setProperty('title.y', getProperty('titlebar.y') + 2)

    updateBORDERS('borderclosebutton1', getProperty('closebutton.x') + 1, getProperty('closebutton.y') + 1)
    updateBORDERS('borderclosebutton2', getProperty('closebutton.x'), getProperty('closebutton.y'))

    setProperty('okbutton.x', (getProperty('window.x') + getProperty('window.width') - 75 - 11))
    setProperty('okbutton.y', (getProperty('window.y') + getProperty('window.height') - 23 - 11))

    setProperty('closeicon.x', (getProperty('closebutton.x') + 4))
    setProperty('closeicon.y', (getProperty('closebutton.y') + 3))

    if getProperty('windowicon') == nil then
        setProperty('body.x', getProperty('window.x') + 9)
        setProperty('body.y', getProperty('window.y') + 34)
    else
        setProperty('windowicon.x', getProperty('window.x') + 14)
        setProperty('windowicon.y', getProperty('window.y') + 33)
        setProperty('body.x', getProperty('windowicon.x') + getProperty('windowicon.width') + 8)
        setProperty('body.y', getProperty('window.y') + 34)
    end

    setProperty('buttonText.x',
        getProperty('okbutton.x') + (getProperty('okbutton.width') / 2) - (getProperty('buttonText.width') / 2))
    setProperty('buttonText.y', (getProperty('okbutton.y') + 3))

    updateBORDERS('borderokbutton1', getProperty('okbutton.x') + 1, getProperty('okbutton.y') + 1)
    updateBORDERS('borderokbutton2', getProperty('okbutton.x'), getProperty('okbutton.y'))

    updateBORDERS('borderwin1', getProperty('window.x') + 1, getProperty('window.y') + 1)
    updateBORDERS('borderwin2', getProperty('window.x'), getProperty('window.y'))
end

function updateBORDERS(tag, objectembedx, objectembedy)
    setProperty(tag .. '1.x', objectembedx)
    setProperty(tag .. '1.y', objectembedy)

    setProperty(tag .. '2.x', objectembedx + getProperty(tag .. '1.width'))
    setProperty(tag .. '2.y', objectembedy)

    setProperty(tag .. '3.x', objectembedx)
    setProperty(tag .. '3.y', objectembedy + getProperty(tag .. '2.height'))

    setProperty(tag .. '4.x', objectembedx)
    setProperty(tag .. '4.y', objectembedy + 1)
end

function createTextQuick(tag, text, x, y, width, alignment, size, bsize, bq, bcolor)
    makeLuaText(tag, text, width, x, y)
    setTextSize(tag, size)

    setTextAlignment(tag, alignment);
    updateHitbox(tag)
    setProperty(tag .. '.borderSize', bsize)
    setProperty(tag .. '.borderQuality', bq)
    setProperty(tag .. '.borderColor', getColorFromHex(bcolor));
    setObjectCamera(tag, 'hud')
end

function createBorder(tag, x, y, width, height, thicc, alpha, color1, color2)
    createQuickBox(tag .. '1', x, y, width - thicc, thicc, 'FFFFFF', alpha)
    createQuickBox(tag .. '2', x + width - thicc, y, thicc, height - thicc, 'FFFFFF', alpha)
    createQuickBox(tag .. '3', x, y + height - thicc, width, thicc, 'FFFFFF', alpha)
    createQuickBox(tag .. '4', x, y + thicc, thicc, height - (thicc * 2), 'FFFFFF', alpha)
    setProperty(tag .. '1.color', getColorFromHex(color1))
    setProperty(tag .. '2.color', getColorFromHex(color2))
    setProperty(tag .. '3.color', getColorFromHex(color2))
    setProperty(tag .. '4.color', getColorFromHex(color1))
end

function createQuickBox(tag, x, y, width, height, color, alpha)
    makeLuaSprite(tag, '', x, y)
    makeGraphic(tag, width, height, color)
    setProperty(tag .. '.alpha', alpha)
    setObjectCamera(tag, 'hud')
    addLuaSprite(tag, true)
end

function rangeIntersect(min0, max0, min1, max1)
    return math.max(min0, max0) >= math.min(min1, max1) and math.min(min0, max0) <= math.max(min1, max1);
end

function pointIntersect(x0, y0, x1, y1, width1, height1)
    return rangeIntersect(x0, x0, x1, x1 + width1) and rangeIntersect(y0, y0, y1, y1 + height1)
end

function createTextQuick(tag, text, x, y, width, alignment, size, bsize, bq, bcolor)
    makeLuaText(tag, text, width, x, y)
    setTextSize(tag, size)

    setTextAlignment(tag, alignment);
    updateHitbox(tag)
    setProperty(tag .. '.borderSize', bsize)
    setProperty(tag .. '.borderQuality', bq)
    setProperty(tag .. '.borderColor', getColorFromHex(bcolor));
    setObjectCamera(tag, 'hud')
end
