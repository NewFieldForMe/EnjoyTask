// MARK: - Mocks generated from file: EnjoyTask/modules/register-module/RegisterInterfaces.swift at 2019-09-16 08:10:15 +0000

//
//  RegisterInterfaces.swift
//  EnjoyTask
//
//  Created by 山田良 on 2019/09/16.
//  Copyright © 2019 yamadaryo. All rights reserve
import Cuckoo
@testable import EnjoyTask

import Foundation


 class MockRegisterViewInterface: RegisterViewInterface, Cuckoo.ProtocolMock {
    
     typealias MocksType = RegisterViewInterface
    
     typealias Stubbing = __StubbingProxy_RegisterViewInterface
     typealias Verification = __VerificationProxy_RegisterViewInterface

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RegisterViewInterface?

     func enableDefaultImplementation(_ stub: RegisterViewInterface) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func showLoadScreen()  {
        
    return cuckoo_manager.call("showLoadScreen()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showLoadScreen())
        
    }
    
    
    
     func hideLoadScreen()  {
        
    return cuckoo_manager.call("hideLoadScreen()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.hideLoadScreen())
        
    }
    
    
    
     func showValidationError()  {
        
    return cuckoo_manager.call("showValidationError()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showValidationError())
        
    }
    

	 struct __StubbingProxy_RegisterViewInterface: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func showLoadScreen() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRegisterViewInterface.self, method: "showLoadScreen()", parameterMatchers: matchers))
	    }
	    
	    func hideLoadScreen() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRegisterViewInterface.self, method: "hideLoadScreen()", parameterMatchers: matchers))
	    }
	    
	    func showValidationError() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockRegisterViewInterface.self, method: "showValidationError()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RegisterViewInterface: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func showLoadScreen() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showLoadScreen()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func hideLoadScreen() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("hideLoadScreen()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showValidationError() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showValidationError()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RegisterViewInterfaceStub: RegisterViewInterface {
    

    

    
     func showLoadScreen()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func hideLoadScreen()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func showValidationError()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockRegisterPresenterInterface: RegisterPresenterInterface, Cuckoo.ProtocolMock {
    
     typealias MocksType = RegisterPresenterInterface
    
     typealias Stubbing = __StubbingProxy_RegisterPresenterInterface
     typealias Verification = __VerificationProxy_RegisterPresenterInterface

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RegisterPresenterInterface?

     func enableDefaultImplementation(_ stub: RegisterPresenterInterface) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func didSelectRegisterAction(email: String?, password: String?)  {
        
    return cuckoo_manager.call("didSelectRegisterAction(email: String?, password: String?)",
            parameters: (email, password),
            escapingParameters: (email, password),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didSelectRegisterAction(email: email, password: password))
        
    }
    

	 struct __StubbingProxy_RegisterPresenterInterface: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func didSelectRegisterAction<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.OptionalMatchable>(email: M1, password: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String?, String?)> where M1.OptionalMatchedType == String, M2.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, String?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRegisterPresenterInterface.self, method: "didSelectRegisterAction(email: String?, password: String?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RegisterPresenterInterface: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func didSelectRegisterAction<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.OptionalMatchable>(email: M1, password: M2) -> Cuckoo.__DoNotUse<(String?, String?), Void> where M1.OptionalMatchedType == String, M2.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?, String?)>] = [wrap(matchable: email) { $0.0 }, wrap(matchable: password) { $0.1 }]
	        return cuckoo_manager.verify("didSelectRegisterAction(email: String?, password: String?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RegisterPresenterInterfaceStub: RegisterPresenterInterface {
    

    

    
     func didSelectRegisterAction(email: String?, password: String?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

