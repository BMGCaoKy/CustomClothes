print('script_server:hello world')

PackageHandlers.registerServerHandler("changeSkinPart",function(player, packet)
    player:changeSkin(packet.skinData)
    PackageHandlers.sendServerHandler(player,"updateSkin")
end)