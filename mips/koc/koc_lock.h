#ifndef KOC_LOCK_H_
#define KOC_LOCK_H_

#include "koc_cpu.h"

#ifdef __cplusplus
extern "C" 
{
#endif

	#define KOC_LOCK_CONTROL_OFFSET             (0)
	#define KOC_LOCK_CONTROL_DEFAULT_VALUE		(0
	#define KOC_LOCK_MEMORY_BARRIER				({__asm__ __volatile__ ( "" : : : "memory");})
	
	typedef struct
	{
		unsigned base_address;
	}
	koc_lock;
	
	static inline __attribute__ ((always_inline))
	void koc_lock_setup(koc_lock* obj,unsigned base_address)
	{
		obj->base_address = base_address;
	}
	
	static inline __attribute__ ((always_inline))
	unsigned koc_lock_take(koc_lock* obj)
	{
		unsigned lockid = cpuid()+1;
		KOC_LOCK_MEMORY_BARRIER;
		*((volatile unsigned*)(obj->base_address+KOC_LOCK_CONTROL_OFFSET)) = lockid;
		KOC_LOCK_MEMORY_BARRIER;
		return (*((volatile unsigned*)(obj->base_address+KOC_LOCK_CONTROL_OFFSET)))==lockid;
	}
	
	static inline __attribute__ ((always_inline))
	void koc_lock_give(koc_lock* obj)
	{
		KOC_LOCK_MEMORY_BARRIER;
		*((volatile unsigned*)(obj->base_address+KOC_LOCK_CONTROL_OFFSET)) = cpuid()+1;
	}
	

#ifdef __cplusplus
}
#endif

#endif /* KOC_LOCK_H_ */