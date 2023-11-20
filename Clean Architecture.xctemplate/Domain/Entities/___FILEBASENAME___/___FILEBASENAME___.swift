//___FILEHEADER___

import Foundation

/// Use this struct to create models with formatted porperties that view will use
struct ___VARIABLE_moduleName___: Codable {
	public let propertyId: Int
	public let property1: String

	public init(
		propertyId: Int,
		property1: String
		) {
		self.propertyId = propertyId
		self.property1 = property1
	}

	enum CodingKeys: String, CodingKey {
		case propertyId = "property_id"
		case property1 = "property_1"
	}
}