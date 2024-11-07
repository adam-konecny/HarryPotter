//
//  CharacterListItem.swift
//  Harry Potter
//
//  Created by Adam Konečný on 07.11.2024.
//

import Kingfisher
import SwiftUI

struct CharacterListItem: View {
    let character: Person
    
    var body: some View {
        HStack {
            KFImage
                .url(URL(string: character.image)!)
                .placeholder {
                    Color.gray.opacity(0.2)
                        .overlay(Image("person"))
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80.0)
                .clipShape(.rect(cornerRadius: 8.0))
            
            VStack(alignment: .leading) {
                Text(character.fullName)
                    .font(.title3)
                    .foregroundColor(.primary)
                
                Text("\"" + character.nickname + "\"")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text(character.interpretedBy)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text(character.birthdate.string(with: .dayMonthYear))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}
