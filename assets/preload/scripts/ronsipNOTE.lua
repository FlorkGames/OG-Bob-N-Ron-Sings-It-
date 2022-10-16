function onUpdate(elapsed)
 	if(inGameOver) then return end
    if boyfriendName == 'RonOG' then 
        for i=0,4,1 do
            setPropertyFromGroup('playerStrums', i, 'texture', 'ronsip')
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'ronsip');
            end
        end
    end
end
