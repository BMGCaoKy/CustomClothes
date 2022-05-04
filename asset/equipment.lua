print("startup ui")
local defaut={
  pants={pants="default_pants"},
  clothes={clothes="default_clothes"},
  face={face="default_face"},
  hair={hair="default_hair"},
  shoes={shoes="default_shoes"},
  head={head="default_head"}
}
local data={
  [1]={
    type="head",
    dataSkin={head="head1"}
  },
  [2]={
    type="head",
    dataSkin={head="head1_2"}
  },
  [3]={
    type="head",
    dataSkin={head="head1_3"}
  },
  [4]={
    type="hair",
    dataSkin={hair="hair2"}
  },
  [5]={
    type="hair",
    dataSkin={hair="hair1"}
  },
  [6]={
    type="pants",
    dataSkin={pants="pants1"}
  }
}
self.Layout.Actor:setActorName(Me:getActorName())
local resetPartSkin=function(type)
  if type=="pants" then
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=defaut.pants})
  elseif type=="clothes" then
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=defaut.clothes})
  elseif type=="face" then
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=defaut.face})
  elseif type=="hair" then
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=defaut.hair})
  elseif type=="shoes" then
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=defaut.shoes})
  elseif type=="head" then
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=defaut.head})
  end
end
PackageHandlers.registerClientHandler("updateSkin",function(player,packet)
  local actorName = Me:getActorName()
  local skin = EntityClient.processSkin(actorName, Me:data("skins"))
  for k, v in pairs(skin) do
    if v == "" then
      self.Layout.Actor:unloadBodyPart(k)
    else
      self.Layout.Actor:useBodyPart(k, v)
    end
  end
end)
for i=1,9 do
  self.Layout.List:child("Data"..i).Button.onMouseClick=function()
    resetPartSkin(data[i].type)
    PackageHandlers.sendClientHandler("changeSkinPart",{skinData=data[i].dataSkin})
    --self.Layout.Actor:setActorName(skin)
  end
end