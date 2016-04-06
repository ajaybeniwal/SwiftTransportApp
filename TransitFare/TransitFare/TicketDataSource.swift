

import UIKit


class TicketDataSource: NSObject ,UITableViewDataSource{
    
    var dataArray = [TicketModel]()
    override init() {
        super.init()
        self.dataArray.append(TicketModel(id:"123",ticketName: "1 day ticket",sourceStation:"Hisar",destinationStation:"New Delhi",price:200,ticketDescription:"Ticket from hisar to delhi",status:"T"))
        
        self.dataArray.append(TicketModel(id:"123",ticketName: "1 day ticket",sourceStation:"Rohtak",destinationStation:"New Delhi",price:200,ticketDescription:"Ticket from hisar to delhi",
            status:"N"))
        
        self.dataArray.append(TicketModel(id:"123",ticketName: "1 day ticket",sourceStation:"Chandigarh",destinationStation:"New Delhi",price:200,ticketDescription:"Ticket from hisar to delhi",status:"N"))
        
        self.dataArray.append(TicketModel(id:"123",ticketName: "1 day ticket",sourceStation:"Hong Kong",destinationStation:"New Delhi",price:200,ticketDescription:"Ticket from hisar to delhi",status:"T"))
    }
}

extension TicketDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ticketCellId = "ticketCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ticketCellId) as? TicketViewCell
        if cell == nil{
            cell = TicketViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ticketCellId)
            
        }
        cell!.sourceDestinationLabel.text = dataArray[indexPath.row].sourceStation
        cell!.destinationStationLabel.text = dataArray[indexPath.row].destinationStation
        cell!.ticketDescriptionLabel.text = dataArray[indexPath.row].ticketDescription
        cell!.statusLabel.text = "Travelled"
        cell!.priceLabel.text = String(dataArray[indexPath.row].price)
        return cell!
    }
    
    

}
