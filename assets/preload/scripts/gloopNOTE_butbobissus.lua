function onUpdate(elapsed)
 	if(inGameOver) then return end
    if dadName == 'BobOG' then 
        for i=0,4,1 do
            setPropertyFromGroup('opponentStrums', i, 'texture', 'gloopy')
        end
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'gloopy');
            end
        end
    end
end
