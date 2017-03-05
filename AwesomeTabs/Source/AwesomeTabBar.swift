//
//  AwesomeTabBar.swift
//  AwesomeTabs
//
//  Created by Alejandro Barros Cuetos on 03/03/2017.
//  Copyright © 2017 Filtercode. All rights reserved.
//

import UIKit

public protocol AwesomeTabBarDelegate: class {
  
  func willSelect(index: Int)
  func didSelect(index: Int)
}

open class AwesomeTabBar: UIView {
  
  // MARK: - Public properties
  
  var currentItem: AwesomeTabBarItem? { return item(at: currentIndex) }
  var currentIndex: Int!
  var count: Int { return items.count }
  weak var delegate: AwesomeTabBarDelegate?
		
  // MARK: - Private properties
  private var items: [AwesomeTabBarItem]!
  
  //MARK: - Public methods
  
  /// Return the AwesomeTabBarItem at the given
  /// index if it exists.
  ///
  /// - Parameter index: The index you want the item of
  /// - Returns: An optional AwesomeTabBarItem
  public func item(at index: Int) -> AwesomeTabBarItem? {
    return index < count ? items[index] : nil
  }
  
  /// Returns the index of the give AwesomeTabBarItem if it's
  /// in the collection.
  ///
  /// - Parameter item: The item to search for
  /// - Returns: An optional Int representing the index
  public func index(for item: AwesomeTabBarItem) -> Int? {
    for (index, tabItem) in items.enumerated() {
      if tabItem == item {
        return index
      }
    }
    return nil
  }
  
  @discardableResult public func selectItem(at index: Int, animated: Bool = true) -> AwesomeTabBarItem {
    precondition(index < count, "Index out of bounds")
    delegate?.willSelect(index: index)
    // Do the actual change
    delegate?.didSelect(index: index)
    return items[index]
  }
  
  @discardableResult public func selectItem(_ item: AwesomeTabBarItem, animated: Bool = true) -> AwesomeTabBarItem {
    guard let index = index(for: item) else {
      preconditionFailure("Item not in collection")
    }
    return selectItem(at: index, animated: animated)
  }
  
  //MARK: - Private methods
}
