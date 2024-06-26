#ifndef KERNEL_NEW_H
#define KERNEL_NEW_H

#include <stddef.h>

void *operator new(size_t size);

void operator delete(void* ptr);

void *operator new[](size_t size);

void operator delete[](void *ptr);

void operator delete(void *ptr, unsigned long sz);

void operator delete[](void *ptr, unsigned long sz);

inline void *operator new(size_t, void *p) throw() 
{ 
    return p; 
}

inline void *operator new[](size_t, void *p) throw() 
{ 
    return p; 
}

inline void operator delete(void *, void *) throw() 
{ }

inline void operator delete[](void *, void *) throw() 
{ }

#endif