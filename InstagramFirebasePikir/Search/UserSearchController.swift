//
//  UserSearchController.swift
//  InstagramFirebasePikir
//
//  Created by Aziz Bibitov on 15.09.2023.
//

import UIKit
import FirebaseDatabase

class UserSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Enter username"
        sb.barTintColor = .gray
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        sb.delegate = self
        sb.autocapitalizationType = .none
        return sb
    }()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchUsers()
    }
    
    fileprivate func fetchUsers() {
        let ref = Database.database().reference().child("users")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            
            print(dictionaries)
            
        }) { (err) in
            print("Failed to fetch users for search:", err)
        }
    }
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationController?.navigationBar.addSubview(searchBar)
        
        let navBar = navigationController?.navigationBar
        
        searchBar.anchor(top: navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        collectionView?.register(UserSearchCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 66)
    }
}
