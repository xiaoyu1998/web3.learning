#include <call.hpp>

using namespace wasm;

static uint32_t test_static1 = 0;
static uint32_t test_static2 = 0;

ACTION call::test(uint64_t i, uint64_t j)
{

    balance1 = 10;
    //balance2 = 10;

    test_static1 = i;
    test_static2 = j;

    print_log();

    print(balance1);
    //print(balance2);
}


void call::print_log()
{
  print(test_static1);
  print(test_static2);

}

WASM_DISPATCH( call, (test))
