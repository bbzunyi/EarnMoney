//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `ChooseTypeViewController`, and contains static references to 2 segues.
    struct chooseTypeViewController {
      /// Segue identifier `income`.
      static let income: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, ChooseTypeViewController, AddBillItemViewController> = Rswift.StoryboardSegueIdentifier(identifier: "income")
      /// Segue identifier `payment`.
      static let payment: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, ChooseTypeViewController, AddBillItemViewController> = Rswift.StoryboardSegueIdentifier(identifier: "payment")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `income`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func income(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, ChooseTypeViewController, AddBillItemViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.chooseTypeViewController.income, segue: segue)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `payment`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func payment(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, ChooseTypeViewController, AddBillItemViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.chooseTypeViewController.payment, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 38 images.
  struct image {
    /// Image `ATM`.
    static let atM = Rswift.ImageResource(bundle: R.hostingBundle, name: "ATM")
    /// Image `add`.
    static let add = Rswift.ImageResource(bundle: R.hostingBundle, name: "add")
    /// Image `amusement`.
    static let amusement = Rswift.ImageResource(bundle: R.hostingBundle, name: "amusement")
    /// Image `baba`.
    static let baba = Rswift.ImageResource(bundle: R.hostingBundle, name: "baba")
    /// Image `baby`.
    static let baby = Rswift.ImageResource(bundle: R.hostingBundle, name: "baby")
    /// Image `book`.
    static let book = Rswift.ImageResource(bundle: R.hostingBundle, name: "book")
    /// Image `daily`.
    static let daily = Rswift.ImageResource(bundle: R.hostingBundle, name: "daily")
    /// Image `edu`.
    static let edu = Rswift.ImageResource(bundle: R.hostingBundle, name: "edu")
    /// Image `fix`.
    static let fix = Rswift.ImageResource(bundle: R.hostingBundle, name: "fix")
    /// Image `food`.
    static let food = Rswift.ImageResource(bundle: R.hostingBundle, name: "food")
    /// Image `game`.
    static let game = Rswift.ImageResource(bundle: R.hostingBundle, name: "game")
    /// Image `gift`.
    static let gift = Rswift.ImageResource(bundle: R.hostingBundle, name: "gift")
    /// Image `goodjob`.
    static let goodjob = Rswift.ImageResource(bundle: R.hostingBundle, name: "goodjob")
    /// Image `hobby`.
    static let hobby = Rswift.ImageResource(bundle: R.hostingBundle, name: "hobby")
    /// Image `home`.
    static let home = Rswift.ImageResource(bundle: R.hostingBundle, name: "home")
    /// Image `icon-baba`.
    static let iconBaba = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon-baba")
    /// Image `icon2`.
    static let icon2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "icon2")
    /// Image `licai`.
    static let licai = Rswift.ImageResource(bundle: R.hostingBundle, name: "licai")
    /// Image `love`.
    static let love = Rswift.ImageResource(bundle: R.hostingBundle, name: "love")
    /// Image `mama`.
    static let mama = Rswift.ImageResource(bundle: R.hostingBundle, name: "mama")
    /// Image `parcel`.
    static let parcel = Rswift.ImageResource(bundle: R.hostingBundle, name: "parcel")
    /// Image `pets`.
    static let pets = Rswift.ImageResource(bundle: R.hostingBundle, name: "pets")
    /// Image `phone`.
    static let phone = Rswift.ImageResource(bundle: R.hostingBundle, name: "phone")
    /// Image `red packet`.
    static let redPacket = Rswift.ImageResource(bundle: R.hostingBundle, name: "red packet")
    /// Image `salary`.
    static let salary = Rswift.ImageResource(bundle: R.hostingBundle, name: "salary")
    /// Image `save`.
    static let save = Rswift.ImageResource(bundle: R.hostingBundle, name: "save")
    /// Image `shopping`.
    static let shopping = Rswift.ImageResource(bundle: R.hostingBundle, name: "shopping")
    /// Image `snacks`.
    static let snacks = Rswift.ImageResource(bundle: R.hostingBundle, name: "snacks")
    /// Image `social`.
    static let social = Rswift.ImageResource(bundle: R.hostingBundle, name: "social")
    /// Image `test2`.
    static let test2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "test2")
    /// Image `test3`.
    static let test3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "test3")
    /// Image `test9`.
    static let test9 = Rswift.ImageResource(bundle: R.hostingBundle, name: "test9")
    /// Image `test`.
    static let test = Rswift.ImageResource(bundle: R.hostingBundle, name: "test")
    /// Image `ticket`.
    static let ticket = Rswift.ImageResource(bundle: R.hostingBundle, name: "ticket")
    /// Image `traffic`.
    static let traffic = Rswift.ImageResource(bundle: R.hostingBundle, name: "traffic")
    /// Image `user`.
    static let user = Rswift.ImageResource(bundle: R.hostingBundle, name: "user")
    /// Image `vip`.
    static let vip = Rswift.ImageResource(bundle: R.hostingBundle, name: "vip")
    /// Image `购物`.
    static let 购物 = Rswift.ImageResource(bundle: R.hostingBundle, name: "购物")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ATM", bundle: ..., traitCollection: ...)`
    static func atM(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.atM, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "add", bundle: ..., traitCollection: ...)`
    static func add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.add, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "amusement", bundle: ..., traitCollection: ...)`
    static func amusement(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.amusement, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "baba", bundle: ..., traitCollection: ...)`
    static func baba(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.baba, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "baby", bundle: ..., traitCollection: ...)`
    static func baby(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.baby, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "book", bundle: ..., traitCollection: ...)`
    static func book(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.book, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "daily", bundle: ..., traitCollection: ...)`
    static func daily(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.daily, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "edu", bundle: ..., traitCollection: ...)`
    static func edu(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.edu, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "fix", bundle: ..., traitCollection: ...)`
    static func fix(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.fix, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "food", bundle: ..., traitCollection: ...)`
    static func food(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.food, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "game", bundle: ..., traitCollection: ...)`
    static func game(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.game, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "gift", bundle: ..., traitCollection: ...)`
    static func gift(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.gift, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "goodjob", bundle: ..., traitCollection: ...)`
    static func goodjob(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.goodjob, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "hobby", bundle: ..., traitCollection: ...)`
    static func hobby(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.hobby, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "home", bundle: ..., traitCollection: ...)`
    static func home(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.home, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icon-baba", bundle: ..., traitCollection: ...)`
    static func iconBaba(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconBaba, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icon2", bundle: ..., traitCollection: ...)`
    static func icon2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "licai", bundle: ..., traitCollection: ...)`
    static func licai(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.licai, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "love", bundle: ..., traitCollection: ...)`
    static func love(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.love, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "mama", bundle: ..., traitCollection: ...)`
    static func mama(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mama, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "parcel", bundle: ..., traitCollection: ...)`
    static func parcel(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.parcel, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pets", bundle: ..., traitCollection: ...)`
    static func pets(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pets, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "phone", bundle: ..., traitCollection: ...)`
    static func phone(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.phone, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "red packet", bundle: ..., traitCollection: ...)`
    static func redPacket(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.redPacket, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "salary", bundle: ..., traitCollection: ...)`
    static func salary(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.salary, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "save", bundle: ..., traitCollection: ...)`
    static func save(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.save, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "shopping", bundle: ..., traitCollection: ...)`
    static func shopping(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.shopping, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "snacks", bundle: ..., traitCollection: ...)`
    static func snacks(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.snacks, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "social", bundle: ..., traitCollection: ...)`
    static func social(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.social, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "test", bundle: ..., traitCollection: ...)`
    static func test(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.test, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "test2", bundle: ..., traitCollection: ...)`
    static func test2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.test2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "test3", bundle: ..., traitCollection: ...)`
    static func test3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.test3, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "test9", bundle: ..., traitCollection: ...)`
    static func test9(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.test9, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ticket", bundle: ..., traitCollection: ...)`
    static func ticket(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ticket, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "traffic", bundle: ..., traitCollection: ...)`
    static func traffic(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.traffic, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "user", bundle: ..., traitCollection: ...)`
    static func user(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.user, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "vip", bundle: ..., traitCollection: ...)`
    static func vip(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.vip, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "购物", bundle: ..., traitCollection: ...)`
    static func 购物(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.购物, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 4 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `MyCell`.
    static let myCell: Rswift.ReuseIdentifier<MyTableViewCell> = Rswift.ReuseIdentifier(identifier: "MyCell")
    /// Reuse identifier `PartCell`.
    static let partCell: Rswift.ReuseIdentifier<PartTimeJobCell> = Rswift.ReuseIdentifier(identifier: "PartCell")
    /// Reuse identifier `TallyCell`.
    static let tallyCell: Rswift.ReuseIdentifier<TallyTableViewCell> = Rswift.ReuseIdentifier(identifier: "TallyCell")
    /// Reuse identifier `morecell`.
    static let morecell: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "morecell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = HomeTabBarController

      let addBillTab = StoryboardViewControllerResource<TabBarViewController>(identifier: "addBillTab")
      let addIncomeBill = StoryboardViewControllerResource<ChooseTypeViewController>(identifier: "addIncomeBill")
      let addPayBill = StoryboardViewControllerResource<ChooseTypeViewController>(identifier: "addPayBill")
      let bundle = R.hostingBundle
      let editWindow = StoryboardViewControllerResource<AddBillItemViewController>(identifier: "EditWindow")
      let jobDetailWindow = StoryboardViewControllerResource<JobDetailController>(identifier: "JobDetailWindow")
      let name = "Main"
      let partJobWindow = StoryboardViewControllerResource<PartTimeJobController>(identifier: "PartJobWindow")
      let tallyWindow = StoryboardViewControllerResource<TallyViewController>(identifier: "TallyWindow")
      let test = StoryboardViewControllerResource<UIKit.UIViewController>(identifier: "test")

      func addBillTab(_: Void = ()) -> TabBarViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: addBillTab)
      }

      func addIncomeBill(_: Void = ()) -> ChooseTypeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: addIncomeBill)
      }

      func addPayBill(_: Void = ()) -> ChooseTypeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: addPayBill)
      }

      func editWindow(_: Void = ()) -> AddBillItemViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: editWindow)
      }

      func jobDetailWindow(_: Void = ()) -> JobDetailController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: jobDetailWindow)
      }

      func partJobWindow(_: Void = ()) -> PartTimeJobController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: partJobWindow)
      }

      func tallyWindow(_: Void = ()) -> TallyViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: tallyWindow)
      }

      func test(_: Void = ()) -> UIKit.UIViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: test)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "25", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '25' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "33", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '33' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ATM", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ATM' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "amusement", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'amusement' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "baba", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'baba' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "baby", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'baby' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "calendar") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'calendar' is used in storyboard 'Main', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "daily", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'daily' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "edu", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'edu' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "fix", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'fix' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "game", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'game' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "gift", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'gift' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "goodjob", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'goodjob' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "hobby", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'hobby' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "home", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'home' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "homekit") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'homekit' is used in storyboard 'Main', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "licai", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'licai' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "line.horizontal.2.decrease.circle.fill") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'line.horizontal.2.decrease.circle.fill' is used in storyboard 'Main', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "love", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'love' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "mama", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'mama' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "parcel", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'parcel' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "person.fill") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'person.fill' is used in storyboard 'Main', but couldn't be loaded.") } }
        if UIKit.UIImage(named: "pets", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'pets' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "phone", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'phone' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "red packet", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'red packet' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "salary", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'salary' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "save", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'save' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "shopping", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'shopping' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "social", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'social' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "test9", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'test9' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ticket", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ticket' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "traffic", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'traffic' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "vip", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'vip' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().editWindow() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'editWindow' could not be loaded from storyboard 'Main' as 'AddBillItemViewController'.") }
        if _R.storyboard.main().jobDetailWindow() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'jobDetailWindow' could not be loaded from storyboard 'Main' as 'JobDetailController'.") }
        if _R.storyboard.main().partJobWindow() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'partJobWindow' could not be loaded from storyboard 'Main' as 'PartTimeJobController'.") }
        if _R.storyboard.main().tallyWindow() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'tallyWindow' could not be loaded from storyboard 'Main' as 'TallyViewController'.") }
        if _R.storyboard.main().addBillTab() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'addBillTab' could not be loaded from storyboard 'Main' as 'TabBarViewController'.") }
        if _R.storyboard.main().addIncomeBill() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'addIncomeBill' could not be loaded from storyboard 'Main' as 'ChooseTypeViewController'.") }
        if _R.storyboard.main().addPayBill() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'addPayBill' could not be loaded from storyboard 'Main' as 'ChooseTypeViewController'.") }
        if _R.storyboard.main().test() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'test' could not be loaded from storyboard 'Main' as 'UIKit.UIViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
