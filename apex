List<Opportunity> oppList = [SELECT Name, Id, Type, AccountId FROM Opportunity WHERE AccountId != null];
List<Opportunity> oppsList = new List<Opportunity>();

for (Opportunity opp : oppList) {
    opp.Type = 'Partner';
    oppsList.add(opp);
}

List<Database.SaveResult> SR = Database.update(oppsList,false);
for (Database.SaveResult result : SR) {
    if (result.isSuccess()) {
        System.debug('Opportunity Updated: ' + result.getId());
    } else {
        for (Database.Error error : result.getErrors()) {
            System.debug('Error updating opportunity:------->>>>>> ' + result.getId() + ' - ' + error.getMessage());
        }
    }
}
