//
//  QuoteTableViewController.swift
//  InspoQuotes
//
//  Created by Angela Yu on 18/08/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import Premise

class QuoteTableViewController: UITableViewController {

	lazy var premiumQuotesIAP: InAppPurchase = {
		return InAppPurchase(named: "PremiumQuotes", using: Bundle.main.bundleIdentifier!)
	}()

	let purchaseText = "Get more quotes..."

	lazy var quotes: [String] = {
		return [String]()
	}()
    
    let freeQuotes = [
        "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
        "All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
        "It does not matter how slowly you go as long as you do not stop. – Confucius",
        "Everything you’ve ever wanted is on the other side of fear. — George Addair",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
        "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
    ]
    
    let premiumQuotes = [
        "Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
        "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
        "There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
        "It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
        "Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

		quotes.append(contentsOf: freeQuotes)
		if !premiumQuotesIAP.isPurchased {
			quotes.append(purchaseText)
		}
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quotes.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell")
		cell!.textLabel!.text = quotes[indexPath.row]
		cell!.textLabel!.numberOfLines = 0

		// If we still need to buy quotes,
		// and it's the last cell, make
		// the cell a purchase button
		if !premiumQuotesIAP.isPurchased
			&& indexPath.row == quotes.count - 1 {
			cell?.textLabel?.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
			cell?.accessoryType = .disclosureIndicator
		}

		return cell!
	}

	// MARK: - table View Delegate
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let quote = quotes[indexPath.row]
		if quote == purchaseText {
			// buy
		}
	}

    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        
    }
}
