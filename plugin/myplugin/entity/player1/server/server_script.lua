print('sandbox:hello word')


     
Trigger.RegisterHandler(this:cfg(), "ENTITY_CLICK", function(context)
  local target = context.obj1 
  local from = context.obj2 
  local skinData = {
    head1 ="head",
    hair="hair2",
  }
  from:changeSkin(skinData)
end)
