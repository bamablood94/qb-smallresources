RegisterCommand("record", function()
    StartRecording(1)
    --QBCore.Functions.Notify("Started Recording!", "success")
    exports['okokNotify']:Alert('Started Recording!', 'You started recording.', 1500, 'success')
end)

RegisterCommand("clip", function()
    StartRecording(0)
end)

RegisterCommand("saveclip", function()
    StopRecordingAndSaveClip()
    --QBCore.Functions.Notify("Saved Recording!", "success")
    exports['okokNotify']:Alert('Saved Recording', 'You saved the recording.', 1500, 'success')
end)

RegisterCommand("delclip", function()
    StopRecordingAndDiscardClip()
    --QBCore.Functions.Notify("Deleted Recording!", "error")
    exports['okokNotify']:Alert('Deleted Recording', 'You deleted the recording', 1500, 'warning')
end)

RegisterCommand("editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    --QBCore.Functions.Notify("Later aligator!", "error")
    exports['okokNotify']:Alert('Left Editor Mode', 'Later Gator!', 1500, 'info')
end)
