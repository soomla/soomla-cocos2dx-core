//
// Created by Fedor on 04/06/14.
//

#include "CCDomainFactory.h"
#include "CCCommonConsts.h"

USING_NS_CC;

using namespace soomla;

static CCDomainFactory *s_SharedDomainFactory = nullptr;

CCDomainFactory *CCDomainFactory::getInstance() {
    if (!s_SharedDomainFactory) {
        s_SharedDomainFactory = new CCDomainFactory();
    }

    return s_SharedDomainFactory;
}

void CCDomainFactory::registerCreator(const char *key, std::function<soomla::CCDomain *(__Dictionary *)> creator) {
    mCreators[std::string(key)] = creator;
}

CCDomain * CCDomainFactory::createWithDictionary(__Dictionary *dict) {
    Ref *typeRef = dict->objectForKey(CCCommonConsts::JSON_JSON_TYPE);
    CC_ASSERT(typeRef != nullptr);
    __String *type = dynamic_cast<__String *>(typeRef);
    CC_ASSERT(type != nullptr);

    return this->createWithDictionaryAndType(dict, type->getCString());
}

soomla::CCDomain *CCDomainFactory::createWithDictionaryAndType(__Dictionary *dict, const char *type) {
    CC_ASSERT(type);
    if (type == nullptr) {
        return nullptr;
    }

    std::function<soomla::CCDomain *(__Dictionary *)> creator = mCreators[type];
    CC_ASSERT(creator);
    if (creator == nullptr) {
        return nullptr;
    }

    return creator(dict);
}
