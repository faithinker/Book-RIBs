//
//  NetworkRepository.swift
//  Book-RIBs
//
//  Created by jhkim on 2023/04/17.
//

import Moya

class NetworkRepository<Service: TargetType> {
  let provider: Networking<Service>

  init(networkingProvider: Networking<Service>) {
    self.provider = networkingProvider
  }
}
