({gotoList : function (component, event, helper) {
        var action = component.get("c.PageRedirect");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var allegations = response.getReturnValue();
                var navEvent = $A.get("e.force:navigateToList");
                navEvent.setParams({
                    "allegationsId": Opportunity.Id,
                    "allegationsName": Opportunity.name,
                    "scope": "Account"
                });
                navEvent.fire();
            }
        });
        $A.enqueueAction(action);
}})