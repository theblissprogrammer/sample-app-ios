//
//  Localizable.swift
//  QoC Test
//
//  Created by Ahmed Saad on 2018-07-25.
//
import Foundation
import ZamzamKit

extension Localizable {
    static let loading = Localizable(NSLocalizedString("loading", comment: "Loading spinner"))
}

// Generic errors
extension Localizable {
    static let unauthorizedErrorTitle = Localizable(NSLocalizedString("unauthorized.error.title", comment: "Unauthorized alert error title"))
    static let noLongerAuthorizedErrorMessage = Localizable(NSLocalizedString("no.longer.authorized.error.message", comment: "Error message for authorization change or expired"))
    static let noDataMessage = Localizable(NSLocalizedString("no.data.message", comment: "Used to display a no data message"))
    static let couldNotSendEmail = Localizable(NSLocalizedString("could.not.send.email", comment: "The title of the dialog alerting the user an email could not be composed"))
    static let couldNotSendEmailMessage = Localizable(NSLocalizedString("could.not.send.email.message", comment: "The message of the dialog alerting the user an email could not be composed"))
}

// Entry
extension Localizable {
    static let entryTitle = Localizable(NSLocalizedString("entry.title", comment: "Entry screen title"))
    static let entryErrorTitle = Localizable(NSLocalizedString("entry.error.title", comment: "Entry alert error title"))
}
