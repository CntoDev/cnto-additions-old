/* expand Transformation on Logic by default, so that Size config
 * for area-using modules can be seen */
class Logic {
    class AttributeCategories {
        class Transformation {
            collapsed = 0;
        };
    };
};

#include "attributes.h"

class Attributes {
#include "attribute_controls.h"
};
