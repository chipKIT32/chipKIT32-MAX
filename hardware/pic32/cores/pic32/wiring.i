# 1 "wiring.c"
# 1 "/opt/local/pic32/Explorer-Arduino//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "wiring.c"
# 32 "wiring.c"
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 1 3
# 41 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/adc10.h" 1 3
# 44 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/adc10.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 1 3
# 27 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx360f512l.h" 1 3
# 11 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx360f512l.h" 3
extern volatile unsigned int WDTCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WDTCLR:1;
    unsigned :1;
    unsigned SWDTPS0:1;
    unsigned SWDTPS1:1;
    unsigned SWDTPS2:1;
    unsigned SWDTPS3:1;
    unsigned SWDTPS4:1;
    unsigned :8;
    unsigned ON:1;
  };
  struct {
    unsigned :2;
    unsigned WDTPSTA:5;
  };
  struct {
    unsigned w:32;
  };
} __WDTCONbits_t;
extern volatile __WDTCONbits_t WDTCONbits __asm__ ("WDTCON") __attribute__((section("sfrs")));
extern volatile unsigned int WDTCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int WDTCONSET __attribute__((section("sfrs")));
extern volatile unsigned int WDTCONINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RTCOE:1;
    unsigned HALFSEC:1;
    unsigned RTCSYNC:1;
    unsigned RTCWREN:1;
    unsigned :2;
    unsigned RTCCLKON:1;
    unsigned RTSECSEL:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned CAL:10;
  };
  struct {
    unsigned w:32;
  };
} __RTCCONbits_t;
extern volatile __RTCCONbits_t RTCCONbits __asm__ ("RTCCON") __attribute__((section("sfrs")));
extern volatile unsigned int RTCCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCCONSET __attribute__((section("sfrs")));
extern volatile unsigned int RTCCONINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRM __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ARPT:8;
    unsigned AMASK:4;
    unsigned ALRMSYNC:1;
    unsigned PIV:1;
    unsigned CHIME:1;
    unsigned ALRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __RTCALRMbits_t;
extern volatile __RTCALRMbits_t RTCALRMbits __asm__ ("RTCALRM") __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRMCLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRMSET __attribute__((section("sfrs")));
extern volatile unsigned int RTCALRMINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIME __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned SEC01:4;
    unsigned SEC10:4;
    unsigned MIN01:4;
    unsigned MIN10:4;
    unsigned HR01:4;
    unsigned HR10:4;
  };
  struct {
    unsigned w:32;
  };
} __RTCTIMEbits_t;
extern volatile __RTCTIMEbits_t RTCTIMEbits __asm__ ("RTCTIME") __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIMECLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIMESET __attribute__((section("sfrs")));
extern volatile unsigned int RTCTIMEINV __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WDAY01:4;
    unsigned :4;
    unsigned DAY01:4;
    unsigned DAY10:4;
    unsigned MONTH01:4;
    unsigned MONTH10:4;
    unsigned YEAR01:4;
    unsigned YEAR10:4;
  };
  struct {
    unsigned w:32;
  };
} __RTCDATEbits_t;
extern volatile __RTCDATEbits_t RTCDATEbits __asm__ ("RTCDATE") __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATECLR __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATESET __attribute__((section("sfrs")));
extern volatile unsigned int RTCDATEINV __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIME __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :8;
    unsigned SEC01:4;
    unsigned SEC10:4;
    unsigned MIN01:4;
    unsigned MIN10:4;
    unsigned HR01:4;
    unsigned HR10:4;
  };
  struct {
    unsigned w:32;
  };
} __ALRMTIMEbits_t;
extern volatile __ALRMTIMEbits_t ALRMTIMEbits __asm__ ("ALRMTIME") __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIMECLR __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIMESET __attribute__((section("sfrs")));
extern volatile unsigned int ALRMTIMEINV __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WDAY01:4;
    unsigned :4;
    unsigned DAY01:4;
    unsigned DAY10:4;
    unsigned MONTH01:4;
    unsigned MONTH10:4;
  };
  struct {
    unsigned w:32;
  };
} __ALRMDATEbits_t;
extern volatile __ALRMDATEbits_t ALRMDATEbits __asm__ ("ALRMDATE") __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATECLR __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATESET __attribute__((section("sfrs")));
extern volatile unsigned int ALRMDATEINV __attribute__((section("sfrs")));
extern volatile unsigned int T1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned TSYNC:1;
    unsigned :1;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned :1;
    unsigned TGATE:1;
    unsigned :3;
    unsigned TWIP:1;
    unsigned TWDIS:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:2;
    unsigned :7;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T1CONbits_t;
extern volatile __T1CONbits_t T1CONbits __asm__ ("T1CON") __attribute__((section("sfrs")));
extern volatile unsigned int T1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR1 __attribute__((section("sfrs")));
extern volatile unsigned int TMR1CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR1SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR1INV __attribute__((section("sfrs")));
extern volatile unsigned int PR1 __attribute__((section("sfrs")));
extern volatile unsigned int PR1CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR1SET __attribute__((section("sfrs")));
extern volatile unsigned int PR1INV __attribute__((section("sfrs")));
extern volatile unsigned int T2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T2CONbits_t;
extern volatile __T2CONbits_t T2CONbits __asm__ ("T2CON") __attribute__((section("sfrs")));
extern volatile unsigned int T2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR2 __attribute__((section("sfrs")));
extern volatile unsigned int TMR23 __attribute__((section("sfrs")));
extern volatile unsigned int TMR2CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR2SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR2INV __attribute__((section("sfrs")));
extern volatile unsigned int PR2 __attribute__((section("sfrs")));
extern volatile unsigned int PR23 __attribute__((section("sfrs")));
extern volatile unsigned int PR2CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR2SET __attribute__((section("sfrs")));
extern volatile unsigned int PR2INV __attribute__((section("sfrs")));
extern volatile unsigned int T3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :2;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T3CONbits_t;
extern volatile __T3CONbits_t T3CONbits __asm__ ("T3CON") __attribute__((section("sfrs")));
extern volatile unsigned int T3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR3 __attribute__((section("sfrs")));
extern volatile unsigned int TMR3CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR3SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR3INV __attribute__((section("sfrs")));
extern volatile unsigned int PR3 __attribute__((section("sfrs")));
extern volatile unsigned int PR3CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR3SET __attribute__((section("sfrs")));
extern volatile unsigned int PR3INV __attribute__((section("sfrs")));
extern volatile unsigned int T4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :1;
    unsigned T32:1;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T4CONbits_t;
extern volatile __T4CONbits_t T4CONbits __asm__ ("T4CON") __attribute__((section("sfrs")));
extern volatile unsigned int T4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR4 __attribute__((section("sfrs")));
extern volatile unsigned int TMR45 __attribute__((section("sfrs")));
extern volatile unsigned int TMR4CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR4SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR4INV __attribute__((section("sfrs")));
extern volatile unsigned int PR4 __attribute__((section("sfrs")));
extern volatile unsigned int PR45 __attribute__((section("sfrs")));
extern volatile unsigned int PR4CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR4SET __attribute__((section("sfrs")));
extern volatile unsigned int PR4INV __attribute__((section("sfrs")));
extern volatile unsigned int T5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TCS:1;
    unsigned :2;
    unsigned TCKPS0:1;
    unsigned TCKPS1:1;
    unsigned TCKPS2:1;
    unsigned TGATE:1;
    unsigned :5;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :4;
    unsigned TCKPS:3;
    unsigned :6;
    unsigned TSIDL:1;
    unsigned :1;
    unsigned TON:1;
  };
  struct {
    unsigned w:32;
  };
} __T5CONbits_t;
extern volatile __T5CONbits_t T5CONbits __asm__ ("T5CON") __attribute__((section("sfrs")));
extern volatile unsigned int T5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int T5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int T5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int TMR5 __attribute__((section("sfrs")));
extern volatile unsigned int TMR5CLR __attribute__((section("sfrs")));
extern volatile unsigned int TMR5SET __attribute__((section("sfrs")));
extern volatile unsigned int TMR5INV __attribute__((section("sfrs")));
extern volatile unsigned int PR5 __attribute__((section("sfrs")));
extern volatile unsigned int PR5CLR __attribute__((section("sfrs")));
extern volatile unsigned int PR5SET __attribute__((section("sfrs")));
extern volatile unsigned int PR5INV __attribute__((section("sfrs")));
extern volatile unsigned int IC1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC1CONbits_t;
extern volatile __IC1CONbits_t IC1CONbits __asm__ ("IC1CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC1BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC2CONbits_t;
extern volatile __IC2CONbits_t IC2CONbits __asm__ ("IC2CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC2BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC3CONbits_t;
extern volatile __IC3CONbits_t IC3CONbits __asm__ ("IC3CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC3BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC4CONbits_t;
extern volatile __IC4CONbits_t IC4CONbits __asm__ ("IC4CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC4BUF __attribute__((section("sfrs")));
extern volatile unsigned int IC5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ICM0:1;
    unsigned ICM1:1;
    unsigned ICM2:1;
    unsigned ICBNE:1;
    unsigned ICOV:1;
    unsigned ICI0:1;
    unsigned ICI1:1;
    unsigned ICTMR:1;
    unsigned C32:1;
    unsigned FEDGE:1;
    unsigned :3;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned ICM:3;
    unsigned :2;
    unsigned ICI:2;
    unsigned :6;
    unsigned ICSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __IC5CONbits_t;
extern volatile __IC5CONbits_t IC5CONbits __asm__ ("IC5CON") __attribute__((section("sfrs")));
extern volatile unsigned int IC5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int IC5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int IC5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int IC5BUF __attribute__((section("sfrs")));
extern volatile unsigned int OC1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC1CONbits_t;
extern volatile __OC1CONbits_t OC1CONbits __asm__ ("OC1CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC1R __attribute__((section("sfrs")));
extern volatile unsigned int OC1RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC1RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC1RS __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC1RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC2CONbits_t;
extern volatile __OC2CONbits_t OC2CONbits __asm__ ("OC2CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC2R __attribute__((section("sfrs")));
extern volatile unsigned int OC2RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC2RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC2RS __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC2RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC3CONbits_t;
extern volatile __OC3CONbits_t OC3CONbits __asm__ ("OC3CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC3R __attribute__((section("sfrs")));
extern volatile unsigned int OC3RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC3RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC3RS __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC3RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC4CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC4CONbits_t;
extern volatile __OC4CONbits_t OC4CONbits __asm__ ("OC4CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC4CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC4CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC4CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC4R __attribute__((section("sfrs")));
extern volatile unsigned int OC4RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC4RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC4RS __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC4RSINV __attribute__((section("sfrs")));
extern volatile unsigned int OC5CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OCM0:1;
    unsigned OCM1:1;
    unsigned OCM2:1;
    unsigned OCTSEL:1;
    unsigned OCFLT:1;
    unsigned OC32:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned OCM:3;
    unsigned :10;
    unsigned OCSIDL:1;
  };
  struct {
    unsigned w:32;
  };
} __OC5CONbits_t;
extern volatile __OC5CONbits_t OC5CONbits __asm__ ("OC5CON") __attribute__((section("sfrs")));
extern volatile unsigned int OC5CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC5CONSET __attribute__((section("sfrs")));
extern volatile unsigned int OC5CONINV __attribute__((section("sfrs")));
extern volatile unsigned int OC5R __attribute__((section("sfrs")));
extern volatile unsigned int OC5RCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSET __attribute__((section("sfrs")));
extern volatile unsigned int OC5RINV __attribute__((section("sfrs")));
extern volatile unsigned int OC5RS __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSCLR __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSSET __attribute__((section("sfrs")));
extern volatile unsigned int OC5RSINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1CONbits_t;
extern volatile __I2C1CONbits_t I2C1CONbits __asm__ ("I2C1CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C1STATbits_t;
extern volatile __I2C1STATbits_t I2C1STATbits __asm__ ("I2C1STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C1TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C1RCV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SEN:1;
    unsigned RSEN:1;
    unsigned PEN:1;
    unsigned RCEN:1;
    unsigned ACKEN:1;
    unsigned ACKDT:1;
    unsigned STREN:1;
    unsigned GCEN:1;
    unsigned SMEN:1;
    unsigned DISSLW:1;
    unsigned A10M:1;
    unsigned STRICT:1;
    unsigned SCLREL:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :11;
    unsigned IPMIEN:1;
    unsigned :1;
    unsigned I2CSIDL:1;
    unsigned :1;
    unsigned I2CEN:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2CONbits_t;
extern volatile __I2C2CONbits_t I2C2CONbits __asm__ ("I2C2CON") __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TBF:1;
    unsigned RBF:1;
    unsigned R_W:1;
    unsigned S:1;
    unsigned P:1;
    unsigned D_A:1;
    unsigned I2COV:1;
    unsigned IWCOL:1;
    unsigned ADD10:1;
    unsigned GCSTAT:1;
    unsigned BCL:1;
    unsigned :3;
    unsigned TRSTAT:1;
    unsigned ACKSTAT:1;
  };
  struct {
    unsigned :6;
    unsigned I2CPOV:1;
  };
  struct {
    unsigned w:32;
  };
} __I2C2STATbits_t;
extern volatile __I2C2STATbits_t I2C2STATbits __asm__ ("I2C2STAT") __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STATSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2STATINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADD __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADDCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADDSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2ADDINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSK __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSKSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2MSKINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRG __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRN __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRNCLR __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRNSET __attribute__((section("sfrs")));
extern volatile unsigned int I2C2TRNINV __attribute__((section("sfrs")));
extern volatile unsigned int I2C2RCV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :5;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned :1;
    unsigned SPIFE:1;
    unsigned :11;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI1CONbits_t;
extern volatile __SPI1CONbits_t SPI1CONbits __asm__ ("SPI1CON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned :2;
    unsigned SPITBE:1;
    unsigned :2;
    unsigned SPIROV:1;
    unsigned :4;
    unsigned SPIBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI1STATbits_t;
extern volatile __SPI1STATbits_t SPI1STATbits __asm__ ("SPI1STAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1STATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI1BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :5;
    unsigned MSTEN:1;
    unsigned CKP:1;
    unsigned SSEN:1;
    unsigned CKE:1;
    unsigned SMP:1;
    unsigned MODE16:1;
    unsigned MODE32:1;
    unsigned DISSDO:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
    unsigned :1;
    unsigned SPIFE:1;
    unsigned :11;
    unsigned FRMPOL:1;
    unsigned FRMSYNC:1;
    unsigned FRMEN:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI2CONbits_t;
extern volatile __SPI2CONbits_t SPI2CONbits __asm__ ("SPI2CON") __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SPIRBF:1;
    unsigned :2;
    unsigned SPITBE:1;
    unsigned :2;
    unsigned SPIROV:1;
    unsigned :4;
    unsigned SPIBUSY:1;
  };
  struct {
    unsigned w:32;
  };
} __SPI2STATbits_t;
extern volatile __SPI2STATbits_t SPI2STATbits __asm__ ("SPI2STAT") __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STATCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STATSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2STATINV __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BUF __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRG __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int SPI2BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U1MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U1MODEbits_t;
extern volatile __U1MODEbits_t U1MODEbits __asm__ ("U1MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U1MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U1MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U1MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U1STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U1STAbits_t;
extern volatile __U1STAbits_t U1STAbits __asm__ ("U1STA") __attribute__((section("sfrs")));
extern volatile unsigned int U1STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U1STASET __attribute__((section("sfrs")));
extern volatile unsigned int U1STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U1TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U1BRG __attribute__((section("sfrs")));
extern volatile unsigned int U1BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U1BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U1BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int U2MODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned STSEL:1;
    unsigned PDSEL0:1;
    unsigned PDSEL1:1;
    unsigned BRGH:1;
    unsigned RXINV:1;
    unsigned ABAUD:1;
    unsigned LPBACK:1;
    unsigned WAKE:1;
    unsigned UEN0:1;
    unsigned UEN1:1;
    unsigned :1;
    unsigned RTSMD:1;
    unsigned IREN:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :1;
    unsigned PDSEL:2;
    unsigned :5;
    unsigned UEN:2;
    unsigned :3;
    unsigned USIDL:1;
    unsigned :1;
    unsigned UARTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __U2MODEbits_t;
extern volatile __U2MODEbits_t U2MODEbits __asm__ ("U2MODE") __attribute__((section("sfrs")));
extern volatile unsigned int U2MODECLR __attribute__((section("sfrs")));
extern volatile unsigned int U2MODESET __attribute__((section("sfrs")));
extern volatile unsigned int U2MODEINV __attribute__((section("sfrs")));
extern volatile unsigned int U2STA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned URXDA:1;
    unsigned OERR:1;
    unsigned FERR:1;
    unsigned PERR:1;
    unsigned RIDLE:1;
    unsigned ADDEN:1;
    unsigned URXISEL0:1;
    unsigned URXISEL1:1;
    unsigned TRMT:1;
    unsigned UTXBF:1;
    unsigned UTXEN:1;
    unsigned UTXBRK:1;
    unsigned URXEN:1;
    unsigned UTXINV:1;
    unsigned UTXISEL0:1;
    unsigned UTXISEL1:1;
    unsigned ADDR:8;
    unsigned ADM_EN:1;
  };
  struct {
    unsigned :6;
    unsigned URXISEL:2;
    unsigned :6;
    unsigned UTXSEL:2;
  };
  struct {
    unsigned w:32;
  };
} __U2STAbits_t;
extern volatile __U2STAbits_t U2STAbits __asm__ ("U2STA") __attribute__((section("sfrs")));
extern volatile unsigned int U2STACLR __attribute__((section("sfrs")));
extern volatile unsigned int U2STASET __attribute__((section("sfrs")));
extern volatile unsigned int U2STAINV __attribute__((section("sfrs")));
extern volatile unsigned int U2TXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2RXREG __attribute__((section("sfrs")));
extern volatile unsigned int U2BRG __attribute__((section("sfrs")));
extern volatile unsigned int U2BRGCLR __attribute__((section("sfrs")));
extern volatile unsigned int U2BRGSET __attribute__((section("sfrs")));
extern volatile unsigned int U2BRGINV __attribute__((section("sfrs")));
extern volatile unsigned int PMCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RDSP:1;
    unsigned WRSP:1;
    unsigned :1;
    unsigned CS1P:1;
    unsigned CS2P:1;
    unsigned ALP:1;
    unsigned CSF0:1;
    unsigned CSF1:1;
    unsigned PTRDEN:1;
    unsigned PTWREN:1;
    unsigned PMPTTL:1;
    unsigned ADRMUX0:1;
    unsigned ADRMUX1:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :6;
    unsigned CSF:2;
    unsigned :3;
    unsigned ADRMUX:2;
    unsigned PSIDL:1;
    unsigned :1;
    unsigned PMPEN:1;
  };
  struct {
    unsigned w:32;
  };
} __PMCONbits_t;
extern volatile __PMCONbits_t PMCONbits __asm__ ("PMCON") __attribute__((section("sfrs")));
extern volatile unsigned int PMCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMCONSET __attribute__((section("sfrs")));
extern volatile unsigned int PMCONINV __attribute__((section("sfrs")));
extern volatile unsigned int PMMODE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned WAITE0:1;
    unsigned WAITE1:1;
    unsigned WAITM0:1;
    unsigned WAITM1:1;
    unsigned WAITM2:1;
    unsigned WAITM3:1;
    unsigned WAITB0:1;
    unsigned WAITB1:1;
    unsigned MODE0:1;
    unsigned MODE1:1;
    unsigned MODE16:1;
    unsigned INCM0:1;
    unsigned INCM1:1;
    unsigned IRQM0:1;
    unsigned IRQM1:1;
    unsigned BUSY:1;
  };
  struct {
    unsigned WAITE:2;
    unsigned WAITM:4;
    unsigned WAITB:2;
    unsigned MODE:2;
    unsigned :1;
    unsigned INCM:2;
    unsigned IRQM:2;
  };
  struct {
    unsigned w:32;
  };
} __PMMODEbits_t;
extern volatile __PMMODEbits_t PMMODEbits __asm__ ("PMMODE") __attribute__((section("sfrs")));
extern volatile unsigned int PMMODECLR __attribute__((section("sfrs")));
extern volatile unsigned int PMMODESET __attribute__((section("sfrs")));
extern volatile unsigned int PMMODEINV __attribute__((section("sfrs")));
extern volatile unsigned int PMADDR __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PADDR:14;
    unsigned CS1:1;
    unsigned CS2:1;
  };
  struct {
    unsigned :14;
    unsigned CS:2;
  };
  struct {
    unsigned w:32;
  };
} __PMADDRbits_t;
extern volatile __PMADDRbits_t PMADDRbits __asm__ ("PMADDR") __attribute__((section("sfrs")));
extern volatile unsigned int PMADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int PMADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUT __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUTCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUTSET __attribute__((section("sfrs")));
extern volatile unsigned int PMDOUTINV __attribute__((section("sfrs")));
extern volatile unsigned int PMDIN __attribute__((section("sfrs")));
extern volatile unsigned int PMDINCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMDINSET __attribute__((section("sfrs")));
extern volatile unsigned int PMDININV __attribute__((section("sfrs")));
extern volatile unsigned int PMAEN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PTEN0:1;
    unsigned PTEN1:1;
    unsigned PTEN2:1;
    unsigned PTEN3:1;
    unsigned PTEN4:1;
    unsigned PTEN5:1;
    unsigned PTEN6:1;
    unsigned PTEN7:1;
    unsigned PTEN8:1;
    unsigned PTEN9:1;
    unsigned PTEN10:1;
    unsigned PTEN11:1;
    unsigned PTEN12:1;
    unsigned PTEN13:1;
    unsigned PTEN14:1;
    unsigned PTEN15:1;
  };
  struct {
    unsigned w:32;
  };
} __PMAENbits_t;
extern volatile __PMAENbits_t PMAENbits __asm__ ("PMAEN") __attribute__((section("sfrs")));
extern volatile unsigned int PMAENCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMAENSET __attribute__((section("sfrs")));
extern volatile unsigned int PMAENINV __attribute__((section("sfrs")));
extern volatile unsigned int PMSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OB0E:1;
    unsigned OB1E:1;
    unsigned OB2E:1;
    unsigned OB3E:1;
    unsigned :2;
    unsigned OBUF:1;
    unsigned OBE:1;
    unsigned IB0F:1;
    unsigned IB1F:1;
    unsigned IB2F:1;
    unsigned IB3F:1;
    unsigned :2;
    unsigned IBOV:1;
    unsigned IBF:1;
  };
  struct {
    unsigned w:32;
  };
} __PMSTATbits_t;
extern volatile __PMSTATbits_t PMSTATbits __asm__ ("PMSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int PMSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int PMSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int PMSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DONE:1;
    unsigned SAMP:1;
    unsigned ASAM:1;
    unsigned :1;
    unsigned CLRASAM:1;
    unsigned SSRC0:1;
    unsigned SSRC1:1;
    unsigned SSRC2:1;
    unsigned FORM0:1;
    unsigned FORM1:1;
    unsigned FORM2:1;
    unsigned :2;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned :5;
    unsigned SSRC:3;
    unsigned FORM:3;
    unsigned :2;
    unsigned ADSIDL:1;
    unsigned :1;
    unsigned ADON:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON1bits_t;
extern volatile __AD1CON1bits_t AD1CON1bits __asm__ ("AD1CON1") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1CLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1SET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON1INV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ALTS:1;
    unsigned BUFM:1;
    unsigned SMPI0:1;
    unsigned SMPI1:1;
    unsigned SMPI2:1;
    unsigned SMPI3:1;
    unsigned :1;
    unsigned BUFS:1;
    unsigned :2;
    unsigned CSCNA:1;
    unsigned :1;
    unsigned OFFCAL:1;
    unsigned VCFG0:1;
    unsigned VCFG1:1;
    unsigned VCFG2:1;
  };
  struct {
    unsigned :2;
    unsigned SMPI:4;
    unsigned :7;
    unsigned VCFG:3;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON2bits_t;
extern volatile __AD1CON2bits_t AD1CON2bits __asm__ ("AD1CON2") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2CLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2SET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON2INV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ADCS0:1;
    unsigned ADCS1:1;
    unsigned ADCS2:1;
    unsigned ADCS3:1;
    unsigned ADCS4:1;
    unsigned ADCS5:1;
    unsigned ADCS6:1;
    unsigned ADCS7:1;
    unsigned SAMC0:1;
    unsigned SAMC1:1;
    unsigned SAMC2:1;
    unsigned SAMC3:1;
    unsigned SAMC4:1;
    unsigned :2;
    unsigned ADRC:1;
  };
  struct {
    unsigned ADCS:8;
    unsigned SAMC:5;
  };
  struct {
    unsigned w:32;
  };
} __AD1CON3bits_t;
extern volatile __AD1CON3bits_t AD1CON3bits __asm__ ("AD1CON3") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3CLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3SET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CON3INV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHS __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :16;
    unsigned CH0SA0:1;
    unsigned CH0SA1:1;
    unsigned CH0SA2:1;
    unsigned CH0SA3:1;
    unsigned :3;
    unsigned CH0NA:1;
    unsigned CH0SB0:1;
    unsigned CH0SB1:1;
    unsigned CH0SB2:1;
    unsigned CH0SB3:1;
    unsigned :3;
    unsigned CH0NB:1;
  };
  struct {
    unsigned :16;
    unsigned CH0SA:4;
    unsigned :4;
    unsigned CH0SB:4;
  };
  struct {
    unsigned w:32;
  };
} __AD1CHSbits_t;
extern volatile __AD1CHSbits_t AD1CHSbits __asm__ ("AD1CHS") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHSCLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHSSET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CHSINV __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSL __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CSSL0:1;
    unsigned CSSL1:1;
    unsigned CSSL2:1;
    unsigned CSSL3:1;
    unsigned CSSL4:1;
    unsigned CSSL5:1;
    unsigned CSSL6:1;
    unsigned CSSL7:1;
    unsigned CSSL8:1;
    unsigned CSSL9:1;
    unsigned CSSL10:1;
    unsigned CSSL11:1;
    unsigned CSSL12:1;
    unsigned CSSL13:1;
    unsigned CSSL14:1;
    unsigned CSSL15:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1CSSLbits_t;
extern volatile __AD1CSSLbits_t AD1CSSLbits __asm__ ("AD1CSSL") __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSLCLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSLSET __attribute__((section("sfrs")));
extern volatile unsigned int AD1CSSLINV __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PCFG0:1;
    unsigned PCFG1:1;
    unsigned PCFG2:1;
    unsigned PCFG3:1;
    unsigned PCFG4:1;
    unsigned PCFG5:1;
    unsigned PCFG6:1;
    unsigned PCFG7:1;
    unsigned PCFG8:1;
    unsigned PCFG9:1;
    unsigned PCFG10:1;
    unsigned PCFG11:1;
    unsigned PCFG12:1;
    unsigned PCFG13:1;
    unsigned PCFG14:1;
    unsigned PCFG15:1;
  };
  struct {
    unsigned w:32;
  };
} __AD1PCFGbits_t;
extern volatile __AD1PCFGbits_t AD1PCFGbits __asm__ ("AD1PCFG") __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFGCLR __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFGSET __attribute__((section("sfrs")));
extern volatile unsigned int AD1PCFGINV __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF0 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF1 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF2 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF3 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF4 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF5 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF6 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF7 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF8 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUF9 __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFA __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFB __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFC __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFD __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFE __attribute__((section("sfrs")));
extern volatile unsigned int ADC1BUFF __attribute__((section("sfrs")));
extern volatile unsigned int CVRCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CVR0:1;
    unsigned CVR1:1;
    unsigned CVR2:1;
    unsigned CVR3:1;
    unsigned CVRSS:1;
    unsigned CVRR:1;
    unsigned CVROE:1;
    unsigned :8;
    unsigned ON:1;
  };
  struct {
    unsigned CVR:4;
  };
  struct {
    unsigned w:32;
  };
} __CVRCONbits_t;
extern volatile __CVRCONbits_t CVRCONbits __asm__ ("CVRCON") __attribute__((section("sfrs")));
extern volatile unsigned int CVRCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CVRCONSET __attribute__((section("sfrs")));
extern volatile unsigned int CVRCONINV __attribute__((section("sfrs")));
extern volatile unsigned int CM1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CCH0:1;
    unsigned CCH1:1;
    unsigned :2;
    unsigned CREF:1;
    unsigned :1;
    unsigned EVPOL0:1;
    unsigned EVPOL1:1;
    unsigned COUT:1;
    unsigned :4;
    unsigned CPOL:1;
    unsigned COE:1;
    unsigned ON:1;
  };
  struct {
    unsigned CCH:2;
    unsigned :4;
    unsigned EVPOL:2;
  };
  struct {
    unsigned w:32;
  };
} __CM1CONbits_t;
extern volatile __CM1CONbits_t CM1CONbits __asm__ ("CM1CON") __attribute__((section("sfrs")));
extern volatile unsigned int CM1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CM1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int CM1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int CM2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CCH0:1;
    unsigned CCH1:1;
    unsigned :2;
    unsigned CREF:1;
    unsigned :1;
    unsigned EVPOL0:1;
    unsigned EVPOL1:1;
    unsigned COUT:1;
    unsigned :4;
    unsigned CPOL:1;
    unsigned COE:1;
    unsigned ON:1;
  };
  struct {
    unsigned CCH:2;
    unsigned :4;
    unsigned EVPOL:2;
  };
  struct {
    unsigned w:32;
  };
} __CM2CONbits_t;
extern volatile __CM2CONbits_t CM2CONbits __asm__ ("CM2CON") __attribute__((section("sfrs")));
extern volatile unsigned int CM2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CM2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int CM2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int CMSTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned C1OUT:1;
    unsigned C2OUT:1;
    unsigned C3OUT:1;
    unsigned C4OUT:1;
    unsigned C5OUT:1;
    unsigned C6OUT:1;
    unsigned :7;
    unsigned SIDL:1;
    unsigned FRZ:1;
  };
  struct {
    unsigned w:32;
  };
} __CMSTATbits_t;
extern volatile __CMSTATbits_t CMSTATbits __asm__ ("CMSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int CMSTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int CMSTATSET __attribute__((section("sfrs")));
extern volatile unsigned int CMSTATINV __attribute__((section("sfrs")));
extern volatile unsigned int OSCCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned OSWEN:1;
    unsigned SOSCEN:1;
    unsigned :1;
    unsigned CF:1;
    unsigned SLPEN:1;
    unsigned LOCK:1;
    unsigned :1;
    unsigned CLKLOCK:1;
    unsigned NOSC0:1;
    unsigned NOSC1:1;
    unsigned NOSC2:1;
    unsigned :1;
    unsigned COSC0:1;
    unsigned COSC1:1;
    unsigned COSC2:1;
    unsigned :1;
    unsigned PLLMULT0:1;
    unsigned PLLMULT1:1;
    unsigned PLLMULT2:1;
    unsigned PBDIV0:1;
    unsigned PBDIV1:1;
    unsigned :1;
    unsigned SOSCRDY:1;
    unsigned :1;
    unsigned FRCDIV0:1;
    unsigned FRCDIV1:1;
    unsigned FRCDIV2:1;
    unsigned PLLODIV0:1;
    unsigned PLLODIV1:1;
    unsigned PLLODIV2:1;
  };
  struct {
    unsigned :8;
    unsigned NOSC:3;
    unsigned :1;
    unsigned COSC:3;
    unsigned :1;
    unsigned PLLMULT:3;
    unsigned PBDIV:2;
    unsigned :3;
    unsigned FRCDIV:3;
    unsigned PLLODIV:3;
  };
  struct {
    unsigned w:32;
  };
} __OSCCONbits_t;
extern volatile __OSCCONbits_t OSCCONbits __asm__ ("OSCCON") __attribute__((section("sfrs")));
extern volatile unsigned int OSCCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int OSCCONSET __attribute__((section("sfrs")));
extern volatile unsigned int OSCCONINV __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TUN0:1;
    unsigned TUN1:1;
    unsigned TUN2:1;
    unsigned TUN3:1;
    unsigned TUN4:1;
    unsigned TUN5:1;
  };
  struct {
    unsigned TUN:6;
  };
  struct {
    unsigned w:32;
  };
} __OSCTUNbits_t;
extern volatile __OSCTUNbits_t OSCTUNbits __asm__ ("OSCTUN") __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUNCLR __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUNSET __attribute__((section("sfrs")));
extern volatile unsigned int OSCTUNINV __attribute__((section("sfrs")));
extern volatile unsigned int DDPCON __attribute__((section("sfrs")));
typedef struct {
  unsigned :2;
  unsigned TROEN:1;
  unsigned JTAGEN:1;
} __DDPCONbits_t;
extern volatile __DDPCONbits_t DDPCONbits __asm__ ("DDPCON") __attribute__((section("sfrs")));
extern unsigned int DEVID __attribute__((section("sfrs")));
extern volatile unsigned int SYSKEY __attribute__((section("sfrs")));
extern volatile unsigned int NVMCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned NVMOP:4;
    unsigned :7;
    unsigned LVDSTAT:1;
    unsigned LVDERR:1;
    unsigned WRERR:1;
    unsigned WREN:1;
    unsigned WR:1;
  };
  struct {
    unsigned NVMOP0:1;
    unsigned NVMOP1:1;
    unsigned NVMOP2:1;
    unsigned NVMOP3:1;
  };
  struct {
    unsigned PROGOP:4;
  };
  struct {
    unsigned PROGOP0:1;
    unsigned PROGOP1:1;
    unsigned PROGOP2:1;
    unsigned PROGOP3:1;
  };
  struct {
    unsigned w:32;
  };
} __NVMCONbits_t;
extern volatile __NVMCONbits_t NVMCONbits __asm__ ("NVMCON") __attribute__((section("sfrs")));
extern volatile unsigned int NVMCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int NVMCONSET __attribute__((section("sfrs")));
extern volatile unsigned int NVMCONINV __attribute__((section("sfrs")));
extern volatile unsigned int NVMKEY __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDR __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int NVMADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int NVMDATA __attribute__((section("sfrs")));
extern volatile unsigned int NVMSRCADDR __attribute__((section("sfrs")));
extern volatile unsigned int RCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned POR:1;
    unsigned BOR:1;
    unsigned IDLE:1;
    unsigned SLEEP:1;
    unsigned WDTO:1;
    unsigned :1;
    unsigned SWR:1;
    unsigned EXTR:1;
    unsigned VREGS:1;
    unsigned CMR:1;
  };
  struct {
    unsigned w:32;
  };
} __RCONbits_t;
extern volatile __RCONbits_t RCONbits __asm__ ("RCON") __attribute__((section("sfrs")));
extern volatile unsigned int RCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int RCONSET __attribute__((section("sfrs")));
extern volatile unsigned int RCONINV __attribute__((section("sfrs")));
extern volatile unsigned int RSWRST __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned SWRST:1;
  };
  struct {
    unsigned w:32;
  };
} __RSWRSTbits_t;
extern volatile __RSWRSTbits_t RSWRSTbits __asm__ ("RSWRST") __attribute__((section("sfrs")));
extern volatile unsigned int RSWRSTCLR __attribute__((section("sfrs")));
extern volatile unsigned int RSWRSTSET __attribute__((section("sfrs")));
extern volatile unsigned int RSWRSTINV __attribute__((section("sfrs")));
extern volatile unsigned int INTCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned INT0EP:1;
    unsigned INT1EP:1;
    unsigned INT2EP:1;
    unsigned INT3EP:1;
    unsigned INT4EP:1;
    unsigned :3;
    unsigned TPC:3;
    unsigned :1;
    unsigned MVEC:1;
    unsigned :1;
    unsigned FRZ:1;
    unsigned SS0:1;
  };
  struct {
    unsigned w:32;
  };
} __INTCONbits_t;
extern volatile __INTCONbits_t INTCONbits __asm__ ("INTCON") __attribute__((section("sfrs")));
extern volatile unsigned int INTCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int INTCONSET __attribute__((section("sfrs")));
extern volatile unsigned int INTCONINV __attribute__((section("sfrs")));
extern volatile unsigned int INTSTAT __attribute__((section("sfrs")));
typedef struct {
  unsigned VEC:8;
  unsigned SRIPL:3;
} __INTSTATbits_t;
extern volatile __INTSTATbits_t INTSTATbits __asm__ ("INTSTAT") __attribute__((section("sfrs")));
extern volatile unsigned int IPTMR __attribute__((section("sfrs")));
extern volatile unsigned int IPTMRCLR __attribute__((section("sfrs")));
extern volatile unsigned int IPTMRSET __attribute__((section("sfrs")));
extern volatile unsigned int IPTMRINV __attribute__((section("sfrs")));
extern volatile unsigned int IFS0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CTIF:1;
    unsigned CS0IF:1;
    unsigned CS1IF:1;
    unsigned INT0IF:1;
    unsigned T1IF:1;
    unsigned IC1IF:1;
    unsigned OC1IF:1;
    unsigned INT1IF:1;
    unsigned T2IF:1;
    unsigned IC2IF:1;
    unsigned OC2IF:1;
    unsigned INT2IF:1;
    unsigned T3IF:1;
    unsigned IC3IF:1;
    unsigned OC3IF:1;
    unsigned INT3IF:1;
    unsigned T4IF:1;
    unsigned IC4IF:1;
    unsigned OC4IF:1;
    unsigned INT4IF:1;
    unsigned T5IF:1;
    unsigned IC5IF:1;
    unsigned OC5IF:1;
    unsigned SPI1EIF:1;
    unsigned SPI1TXIF:1;
    unsigned SPI1RXIF:1;
    unsigned U1EIF:1;
    unsigned U1RXIF:1;
    unsigned U1TXIF:1;
    unsigned I2C1BIF:1;
    unsigned I2C1SIF:1;
    unsigned I2C1MIF:1;
  };
  struct {
    unsigned w:32;
  };
} __IFS0bits_t;
extern volatile __IFS0bits_t IFS0bits __asm__ ("IFS0") __attribute__((section("sfrs")));
extern volatile unsigned int IFS0CLR __attribute__((section("sfrs")));
extern volatile unsigned int IFS0SET __attribute__((section("sfrs")));
extern volatile unsigned int IFS0INV __attribute__((section("sfrs")));
extern volatile unsigned int IFS1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNIF:1;
    unsigned AD1IF:1;
    unsigned PMPIF:1;
    unsigned CMP1IF:1;
    unsigned CMP2IF:1;
    unsigned SPI2EIF:1;
    unsigned SPI2TXIF:1;
    unsigned SPI2RXIF:1;
    unsigned U2EIF:1;
    unsigned U2RXIF:1;
    unsigned U2TXIF:1;
    unsigned I2C2BIF:1;
    unsigned I2C2SIF:1;
    unsigned I2C2MIF:1;
    unsigned FSCMIF:1;
    unsigned RTCCIF:1;
    unsigned DMA0IF:1;
    unsigned DMA1IF:1;
    unsigned DMA2IF:1;
    unsigned DMA3IF:1;
    unsigned :4;
    unsigned FCEIF:1;
  };
  struct {
    unsigned w:32;
  };
} __IFS1bits_t;
extern volatile __IFS1bits_t IFS1bits __asm__ ("IFS1") __attribute__((section("sfrs")));
extern volatile unsigned int IFS1CLR __attribute__((section("sfrs")));
extern volatile unsigned int IFS1SET __attribute__((section("sfrs")));
extern volatile unsigned int IFS1INV __attribute__((section("sfrs")));
extern volatile unsigned int IFS2 __attribute__((section("sfrs")));
extern volatile unsigned int IFS2CLR __attribute__((section("sfrs")));
extern volatile unsigned int IFS2SET __attribute__((section("sfrs")));
extern volatile unsigned int IFS2INV __attribute__((section("sfrs")));
extern volatile unsigned int IEC0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CTIE:1;
    unsigned CS0IE:1;
    unsigned CS1IE:1;
    unsigned INT0IE:1;
    unsigned T1IE:1;
    unsigned IC1IE:1;
    unsigned OC1IE:1;
    unsigned INT1IE:1;
    unsigned T2IE:1;
    unsigned IC2IE:1;
    unsigned OC2IE:1;
    unsigned INT2IE:1;
    unsigned T3IE:1;
    unsigned IC3IE:1;
    unsigned OC3IE:1;
    unsigned INT3IE:1;
    unsigned T4IE:1;
    unsigned IC4IE:1;
    unsigned OC4IE:1;
    unsigned INT4IE:1;
    unsigned T5IE:1;
    unsigned IC5IE:1;
    unsigned OC5IE:1;
    unsigned SPI1EIE:1;
    unsigned SPI1TXIE:1;
    unsigned SPI1RXIE:1;
    unsigned U1EIE:1;
    unsigned U1RXIE:1;
    unsigned U1TXIE:1;
    unsigned I2C1BIE:1;
    unsigned I2C1SIE:1;
    unsigned I2C1MIE:1;
  };
  struct {
    unsigned w:32;
  };
} __IEC0bits_t;
extern volatile __IEC0bits_t IEC0bits __asm__ ("IEC0") __attribute__((section("sfrs")));
extern volatile unsigned int IEC0CLR __attribute__((section("sfrs")));
extern volatile unsigned int IEC0SET __attribute__((section("sfrs")));
extern volatile unsigned int IEC0INV __attribute__((section("sfrs")));
extern volatile unsigned int IEC1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNIE:1;
    unsigned AD1IE:1;
    unsigned PMPIE:1;
    unsigned CMP1IE:1;
    unsigned CMP2IE:1;
    unsigned SPI2EIE:1;
    unsigned SPI2TXIE:1;
    unsigned SPI2RXIE:1;
    unsigned U2EIE:1;
    unsigned U2RXIE:1;
    unsigned U2TXIE:1;
    unsigned I2C2BIE:1;
    unsigned I2C2SIE:1;
    unsigned I2C2MIE:1;
    unsigned FSCMIE:1;
    unsigned RTCCIE:1;
    unsigned DMA0IE:1;
    unsigned DMA1IE:1;
    unsigned DMA2IE:1;
    unsigned DMA3IE:1;
    unsigned :4;
    unsigned FCEIE:1;
  };
  struct {
    unsigned w:32;
  };
} __IEC1bits_t;
extern volatile __IEC1bits_t IEC1bits __asm__ ("IEC1") __attribute__((section("sfrs")));
extern volatile unsigned int IEC1CLR __attribute__((section("sfrs")));
extern volatile unsigned int IEC1SET __attribute__((section("sfrs")));
extern volatile unsigned int IEC1INV __attribute__((section("sfrs")));
extern volatile unsigned int IEC2 __attribute__((section("sfrs")));
extern volatile unsigned int IEC2CLR __attribute__((section("sfrs")));
extern volatile unsigned int IEC2SET __attribute__((section("sfrs")));
extern volatile unsigned int IEC2INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CTIS:2;
    unsigned CTIP:3;
    unsigned :3;
    unsigned CS0IS:2;
    unsigned CS0IP:3;
    unsigned :3;
    unsigned CS1IS:2;
    unsigned CS1IP:3;
    unsigned :3;
    unsigned INT0IS:2;
    unsigned INT0IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC0bits_t;
extern volatile __IPC0bits_t IPC0bits __asm__ ("IPC0") __attribute__((section("sfrs")));
extern volatile unsigned int IPC0CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC0SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC0INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T1IS:2;
    unsigned T1IP:3;
    unsigned :3;
    unsigned IC1IS:2;
    unsigned IC1IP:3;
    unsigned :3;
    unsigned OC1IS:2;
    unsigned OC1IP:3;
    unsigned :3;
    unsigned INT1IS:2;
    unsigned INT1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC1bits_t;
extern volatile __IPC1bits_t IPC1bits __asm__ ("IPC1") __attribute__((section("sfrs")));
extern volatile unsigned int IPC1CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC1SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC1INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T2IS:2;
    unsigned T2IP:3;
    unsigned :3;
    unsigned IC2IS:2;
    unsigned IC2IP:3;
    unsigned :3;
    unsigned OC2IS:2;
    unsigned OC2IP:3;
    unsigned :3;
    unsigned INT2IS:2;
    unsigned INT2IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC2bits_t;
extern volatile __IPC2bits_t IPC2bits __asm__ ("IPC2") __attribute__((section("sfrs")));
extern volatile unsigned int IPC2CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC2SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC2INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T3IS:2;
    unsigned T3IP:3;
    unsigned :3;
    unsigned IC3IS:2;
    unsigned IC3IP:3;
    unsigned :3;
    unsigned OC3IS:2;
    unsigned OC3IP:3;
    unsigned :3;
    unsigned INT3IS:2;
    unsigned INT3IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC3bits_t;
extern volatile __IPC3bits_t IPC3bits __asm__ ("IPC3") __attribute__((section("sfrs")));
extern volatile unsigned int IPC3CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC3SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC3INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC4 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T4IS:2;
    unsigned T4IP:3;
    unsigned :3;
    unsigned IC4IS:2;
    unsigned IC4IP:3;
    unsigned :3;
    unsigned OC4IS:2;
    unsigned OC4IP:3;
    unsigned :3;
    unsigned INT4IS:2;
    unsigned INT4IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC4bits_t;
extern volatile __IPC4bits_t IPC4bits __asm__ ("IPC4") __attribute__((section("sfrs")));
extern volatile unsigned int IPC4CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC4SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC4INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC5 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned T5IS:2;
    unsigned T5IP:3;
    unsigned :3;
    unsigned IC5IS:2;
    unsigned IC5IP:3;
    unsigned :3;
    unsigned OC5IS:2;
    unsigned OC5IP:3;
    unsigned :3;
    unsigned SPI1IS:2;
    unsigned SPI1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC5bits_t;
extern volatile __IPC5bits_t IPC5bits __asm__ ("IPC5") __attribute__((section("sfrs")));
extern volatile unsigned int IPC5CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC5SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC5INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC6 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned U1IS:2;
    unsigned U1IP:3;
    unsigned :3;
    unsigned I2C1IS:2;
    unsigned I2C1IP:3;
    unsigned :3;
    unsigned CNIS:2;
    unsigned CNIP:3;
    unsigned :3;
    unsigned AD1IS:2;
    unsigned AD1IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC6bits_t;
extern volatile __IPC6bits_t IPC6bits __asm__ ("IPC6") __attribute__((section("sfrs")));
extern volatile unsigned int IPC6CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC6SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC6INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC7 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PMPIS:2;
    unsigned PMPIP:3;
    unsigned :3;
    unsigned CMP1IS:2;
    unsigned CMP1IP:3;
    unsigned :3;
    unsigned CMP2IS:2;
    unsigned CMP2IP:3;
    unsigned :3;
    unsigned SPI2IS:2;
    unsigned SPI2IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC7bits_t;
extern volatile __IPC7bits_t IPC7bits __asm__ ("IPC7") __attribute__((section("sfrs")));
extern volatile unsigned int IPC7CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC7SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC7INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC8 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned U2IS:2;
    unsigned U2IP:3;
    unsigned :3;
    unsigned I2C2IS:2;
    unsigned I2C2IP:3;
    unsigned :3;
    unsigned FSCMIS:2;
    unsigned FSCMIP:3;
    unsigned :3;
    unsigned RTCCIS:2;
    unsigned RTCCIP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC8bits_t;
extern volatile __IPC8bits_t IPC8bits __asm__ ("IPC8") __attribute__((section("sfrs")));
extern volatile unsigned int IPC8CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC8SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC8INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC9 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DMA0IS:2;
    unsigned DMA0IP:3;
    unsigned :3;
    unsigned DMA1IS:2;
    unsigned DMA1IP:3;
    unsigned :3;
    unsigned DMA2IS:2;
    unsigned DMA2IP:3;
    unsigned :3;
    unsigned DMA3IS:2;
    unsigned DMA3IP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC9bits_t;
extern volatile __IPC9bits_t IPC9bits __asm__ ("IPC9") __attribute__((section("sfrs")));
extern volatile unsigned int IPC9CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC9SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC9INV __attribute__((section("sfrs")));
extern volatile unsigned int IPC11 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FCEIS:2;
    unsigned FCEIP:3;
  };
  struct {
    unsigned w:32;
  };
} __IPC11bits_t;
extern volatile __IPC11bits_t IPC11bits __asm__ ("IPC11") __attribute__((section("sfrs")));
extern volatile unsigned int IPC11CLR __attribute__((section("sfrs")));
extern volatile unsigned int IPC11SET __attribute__((section("sfrs")));
extern volatile unsigned int IPC11INV __attribute__((section("sfrs")));
extern volatile unsigned int BMXCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned BMXARB:3;
    unsigned :3;
    unsigned BMXWSDRM:1;
    unsigned :9;
    unsigned BMXERRIS:1;
    unsigned BMXERRDS:1;
    unsigned BMXERRDMA:1;
    unsigned BMXERRICD:1;
    unsigned BMXERRIXI:1;
    unsigned :5;
    unsigned BMXCHEDMA:1;
  };
  struct {
    unsigned w:32;
  };
} __BMXCONbits_t;
extern volatile __BMXCONbits_t BMXCONbits __asm__ ("BMXCON") __attribute__((section("sfrs")));
extern volatile unsigned int BMXCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXCONSET __attribute__((section("sfrs")));
extern volatile unsigned int BMXCONINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXDKPBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUDBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXDUPBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXDRMSZ __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBA __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBACLR __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBASET __attribute__((section("sfrs")));
extern volatile unsigned int BMXPUPBAINV __attribute__((section("sfrs")));
extern volatile unsigned int BMXPFMSZ __attribute__((section("sfrs")));
extern volatile unsigned int BMXBOOTSZ __attribute__((section("sfrs")));
extern volatile unsigned int DMACON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :12;
    unsigned SUSPEND:1;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __DMACONbits_t;
extern volatile __DMACONbits_t DMACONbits __asm__ ("DMACON") __attribute__((section("sfrs")));
extern volatile unsigned int DMACONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DMACONSET __attribute__((section("sfrs")));
extern volatile unsigned int DMACONINV __attribute__((section("sfrs")));
extern volatile unsigned int DMASTAT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned DMACH:2;
    unsigned :1;
    unsigned RDWR:1;
  };
  struct {
    unsigned w:32;
  };
} __DMASTATbits_t;
extern volatile __DMASTATbits_t DMASTATbits __asm__ ("DMASTAT") __attribute__((section("sfrs")));
extern volatile unsigned int DMASTATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DMASTATSET __attribute__((section("sfrs")));
extern volatile unsigned int DMASTATINV __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDR __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDRSET __attribute__((section("sfrs")));
extern volatile unsigned int DMAADDRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CRCCH:2;
    unsigned :4;
    unsigned CRCAPP:1;
    unsigned CRCEN:1;
    unsigned PLEN:4;
  };
  struct {
    unsigned w:32;
  };
} __DCRCCONbits_t;
extern volatile __DCRCCONbits_t DCRCCONbits __asm__ ("DCRCCON") __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCRCCONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATA __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATASET __attribute__((section("sfrs")));
extern volatile unsigned int DCRCDATAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXOR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXORCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXORSET __attribute__((section("sfrs")));
extern volatile unsigned int DCRCXORINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH0CONbits_t;
extern volatile __DCH0CONbits_t DCH0CONbits __asm__ ("DCH0CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH0ECONbits_t;
extern volatile __DCH0ECONbits_t DCH0ECONbits __asm__ ("DCH0ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH0INTbits_t;
extern volatile __DCH0INTbits_t DCH0INTbits __asm__ ("DCH0INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH0DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned rsvd:2;
  };
  struct {
    unsigned w:32;
  };
} __DCH1CONbits_t;
extern volatile __DCH1CONbits_t DCH1CONbits __asm__ ("DCH1CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH1ECONbits_t;
extern volatile __DCH1ECONbits_t DCH1ECONbits __asm__ ("DCH1ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH1INTbits_t;
extern volatile __DCH1INTbits_t DCH1INTbits __asm__ ("DCH1INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH1DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned rsvd:2;
  };
  struct {
    unsigned w:32;
  };
} __DCH2CONbits_t;
extern volatile __DCH2CONbits_t DCH2CONbits __asm__ ("DCH2CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH2ECONbits_t;
extern volatile __DCH2ECONbits_t DCH2ECONbits __asm__ ("DCH2ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH2INTbits_t;
extern volatile __DCH2INTbits_t DCH2INTbits __asm__ ("DCH2INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH2DATINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHPRI:2;
    unsigned CHEDET:1;
    unsigned :1;
    unsigned CHAEN:1;
    unsigned CHCHN:1;
    unsigned CHAED:1;
    unsigned CHEN:1;
    unsigned CHCHNS:1;
    unsigned rsvd:2;
  };
  struct {
    unsigned w:32;
  };
} __DCH3CONbits_t;
extern volatile __DCH3CONbits_t DCH3CONbits __asm__ ("DCH3CON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :3;
    unsigned AIRQEN:1;
    unsigned SIRQEN:1;
    unsigned PATEN:1;
    unsigned CABORT:1;
    unsigned CFORCE:1;
    unsigned CHSIRQ:8;
    unsigned CHAIRQ:8;
  };
  struct {
    unsigned w:32;
  };
} __DCH3ECONbits_t;
extern volatile __DCH3ECONbits_t DCH3ECONbits __asm__ ("DCH3ECON") __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECONSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3ECONINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INT __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CHERIF:1;
    unsigned CHTAIF:1;
    unsigned CHCCIF:1;
    unsigned CHBCIF:1;
    unsigned CHDHIF:1;
    unsigned CHDDIF:1;
    unsigned CHSHIF:1;
    unsigned CHSDIF:1;
    unsigned :8;
    unsigned CHERIE:1;
    unsigned CHTAIE:1;
    unsigned CHCCIE:1;
    unsigned CHBCIE:1;
    unsigned CHDHIE:1;
    unsigned CHDDIE:1;
    unsigned CHSHIE:1;
    unsigned CHSDIE:1;
  };
  struct {
    unsigned w:32;
  };
} __DCH3INTbits_t;
extern volatile __DCH3INTbits_t DCH3INTbits __asm__ ("DCH3INT") __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INTCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INTSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3INTINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSA __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSACLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSASET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSAINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3SPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZ __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CSIZINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTRCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTRSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3CPTRINV __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DAT __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DATCLR __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DATSET __attribute__((section("sfrs")));
extern volatile unsigned int DCH3DATINV __attribute__((section("sfrs")));
extern volatile unsigned int CHECON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned PFMWS:3;
    unsigned :1;
    unsigned PREFEN:2;
    unsigned :2;
    unsigned DCSZ:2;
    unsigned :6;
    unsigned CHECOH:1;
  };
  struct {
    unsigned w:32;
  };
} __CHECONbits_t;
extern volatile __CHECONbits_t CHECONbits __asm__ ("CHECON") __attribute__((section("sfrs")));
extern volatile unsigned int CHECONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHECONSET __attribute__((section("sfrs")));
extern volatile unsigned int CHECONINV __attribute__((section("sfrs")));
extern volatile unsigned int CHEACC __attribute__((section("sfrs")));
extern volatile unsigned int CHEACCCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHEACCSET __attribute__((section("sfrs")));
extern volatile unsigned int CHEACCINV __attribute__((section("sfrs")));
extern volatile unsigned int CHETAG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned LTYPE:1;
    unsigned LLOCK:1;
    unsigned LVALID:1;
    unsigned LTAG:20;
  };
  struct {
    unsigned w:32;
  };
} __CHETAGbits_t;
extern volatile __CHETAGbits_t CHETAGbits __asm__ ("CHETAG") __attribute__((section("sfrs")));
extern volatile unsigned int CHETAGCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHETAGSET __attribute__((section("sfrs")));
extern volatile unsigned int CHETAGINV __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSK __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSKCLR __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSKSET __attribute__((section("sfrs")));
extern volatile unsigned int CHEMSKINV __attribute__((section("sfrs")));
extern volatile unsigned int CHEW0 __attribute__((section("sfrs")));
extern volatile unsigned int CHEW1 __attribute__((section("sfrs")));
extern volatile unsigned int CHEW2 __attribute__((section("sfrs")));
extern volatile unsigned int CHEW3 __attribute__((section("sfrs")));
extern volatile unsigned int CHELRU __attribute__((section("sfrs")));
extern volatile unsigned int CHEHIT __attribute__((section("sfrs")));
extern volatile unsigned int CHEMIS __attribute__((section("sfrs")));
extern volatile unsigned int CHEPFABT __attribute__((section("sfrs")));
extern volatile unsigned int TRISA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISA0:1;
    unsigned TRISA1:1;
    unsigned TRISA2:1;
    unsigned TRISA3:1;
    unsigned TRISA4:1;
    unsigned TRISA5:1;
    unsigned TRISA6:1;
    unsigned TRISA7:1;
    unsigned :1;
    unsigned TRISA9:1;
    unsigned TRISA10:1;
    unsigned :3;
    unsigned TRISA14:1;
    unsigned TRISA15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISAbits_t;
extern volatile __TRISAbits_t TRISAbits __asm__ ("TRISA") __attribute__((section("sfrs")));
extern volatile unsigned int TRISACLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISASET __attribute__((section("sfrs")));
extern volatile unsigned int TRISAINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RA0:1;
    unsigned RA1:1;
    unsigned RA2:1;
    unsigned RA3:1;
    unsigned RA4:1;
    unsigned RA5:1;
    unsigned RA6:1;
    unsigned RA7:1;
    unsigned :1;
    unsigned RA9:1;
    unsigned RA10:1;
    unsigned :3;
    unsigned RA14:1;
    unsigned RA15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTAbits_t;
extern volatile __PORTAbits_t PORTAbits __asm__ ("PORTA") __attribute__((section("sfrs")));
extern volatile unsigned int PORTACLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTASET __attribute__((section("sfrs")));
extern volatile unsigned int PORTAINV __attribute__((section("sfrs")));
extern volatile unsigned int LATA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATA0:1;
    unsigned LATA1:1;
    unsigned LATA2:1;
    unsigned LATA3:1;
    unsigned LATA4:1;
    unsigned LATA5:1;
    unsigned LATA6:1;
    unsigned LATA7:1;
    unsigned :1;
    unsigned LATA9:1;
    unsigned LATA10:1;
    unsigned :3;
    unsigned LATA14:1;
    unsigned LATA15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATAbits_t;
extern volatile __LATAbits_t LATAbits __asm__ ("LATA") __attribute__((section("sfrs")));
extern volatile unsigned int LATACLR __attribute__((section("sfrs")));
extern volatile unsigned int LATASET __attribute__((section("sfrs")));
extern volatile unsigned int LATAINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCA __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCA0:1;
    unsigned ODCA1:1;
    unsigned ODCA2:1;
    unsigned ODCA3:1;
    unsigned ODCA4:1;
    unsigned ODCA5:1;
    unsigned ODCA6:1;
    unsigned ODCA7:1;
    unsigned :1;
    unsigned ODCA9:1;
    unsigned ODCA10:1;
    unsigned :3;
    unsigned ODCA14:1;
    unsigned ODCA15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCAbits_t;
extern volatile __ODCAbits_t ODCAbits __asm__ ("ODCA") __attribute__((section("sfrs")));
extern volatile unsigned int ODCACLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCASET __attribute__((section("sfrs")));
extern volatile unsigned int ODCAINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISB0:1;
    unsigned TRISB1:1;
    unsigned TRISB2:1;
    unsigned TRISB3:1;
    unsigned TRISB4:1;
    unsigned TRISB5:1;
    unsigned TRISB6:1;
    unsigned TRISB7:1;
    unsigned TRISB8:1;
    unsigned TRISB9:1;
    unsigned TRISB10:1;
    unsigned TRISB11:1;
    unsigned TRISB12:1;
    unsigned TRISB13:1;
    unsigned TRISB14:1;
    unsigned TRISB15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISBbits_t;
extern volatile __TRISBbits_t TRISBbits __asm__ ("TRISB") __attribute__((section("sfrs")));
extern volatile unsigned int TRISBCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISBSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISBINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RB0:1;
    unsigned RB1:1;
    unsigned RB2:1;
    unsigned RB3:1;
    unsigned RB4:1;
    unsigned RB5:1;
    unsigned RB6:1;
    unsigned RB7:1;
    unsigned RB8:1;
    unsigned RB9:1;
    unsigned RB10:1;
    unsigned RB11:1;
    unsigned RB12:1;
    unsigned RB13:1;
    unsigned RB14:1;
    unsigned RB15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTBbits_t;
extern volatile __PORTBbits_t PORTBbits __asm__ ("PORTB") __attribute__((section("sfrs")));
extern volatile unsigned int PORTBCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTBSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTBINV __attribute__((section("sfrs")));
extern volatile unsigned int LATB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATB0:1;
    unsigned LATB1:1;
    unsigned LATB2:1;
    unsigned LATB3:1;
    unsigned LATB4:1;
    unsigned LATB5:1;
    unsigned LATB6:1;
    unsigned LATB7:1;
    unsigned LATB8:1;
    unsigned LATB9:1;
    unsigned LATB10:1;
    unsigned LATB11:1;
    unsigned LATB12:1;
    unsigned LATB13:1;
    unsigned LATB14:1;
    unsigned LATB15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATBbits_t;
extern volatile __LATBbits_t LATBbits __asm__ ("LATB") __attribute__((section("sfrs")));
extern volatile unsigned int LATBCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATBSET __attribute__((section("sfrs")));
extern volatile unsigned int LATBINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCB __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCB0:1;
    unsigned ODCB1:1;
    unsigned ODCB2:1;
    unsigned ODCB3:1;
    unsigned ODCB4:1;
    unsigned ODCB5:1;
    unsigned ODCB6:1;
    unsigned ODCB7:1;
    unsigned ODCB8:1;
    unsigned ODCB9:1;
    unsigned ODCB10:1;
    unsigned ODCB11:1;
    unsigned ODCB12:1;
    unsigned ODCB13:1;
    unsigned ODCB14:1;
    unsigned ODCB15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCBbits_t;
extern volatile __ODCBbits_t ODCBbits __asm__ ("ODCB") __attribute__((section("sfrs")));
extern volatile unsigned int ODCBCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCBSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCBINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned TRISC1:1;
    unsigned TRISC2:1;
    unsigned TRISC3:1;
    unsigned TRISC4:1;
    unsigned :7;
    unsigned TRISC12:1;
    unsigned TRISC13:1;
    unsigned TRISC14:1;
    unsigned TRISC15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISCbits_t;
extern volatile __TRISCbits_t TRISCbits __asm__ ("TRISC") __attribute__((section("sfrs")));
extern volatile unsigned int TRISCCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISCSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISCINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned RC1:1;
    unsigned RC2:1;
    unsigned RC3:1;
    unsigned RC4:1;
    unsigned :7;
    unsigned RC12:1;
    unsigned RC13:1;
    unsigned RC14:1;
    unsigned RC15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTCbits_t;
extern volatile __PORTCbits_t PORTCbits __asm__ ("PORTC") __attribute__((section("sfrs")));
extern volatile unsigned int PORTCCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTCSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTCINV __attribute__((section("sfrs")));
extern volatile unsigned int LATC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned LATC1:1;
    unsigned LATC2:1;
    unsigned LATC3:1;
    unsigned LATC4:1;
    unsigned :7;
    unsigned LATC12:1;
    unsigned LATC13:1;
    unsigned LATC14:1;
    unsigned LATC15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATCbits_t;
extern volatile __LATCbits_t LATCbits __asm__ ("LATC") __attribute__((section("sfrs")));
extern volatile unsigned int LATCCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATCSET __attribute__((section("sfrs")));
extern volatile unsigned int LATCINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCC __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :1;
    unsigned ODCC1:1;
    unsigned ODCC2:1;
    unsigned ODCC3:1;
    unsigned ODCC4:1;
    unsigned :7;
    unsigned ODCC12:1;
    unsigned ODCC13:1;
    unsigned ODCC14:1;
    unsigned ODCC15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCCbits_t;
extern volatile __ODCCbits_t ODCCbits __asm__ ("ODCC") __attribute__((section("sfrs")));
extern volatile unsigned int ODCCCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCCSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCCINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISD0:1;
    unsigned TRISD1:1;
    unsigned TRISD2:1;
    unsigned TRISD3:1;
    unsigned TRISD4:1;
    unsigned TRISD5:1;
    unsigned TRISD6:1;
    unsigned TRISD7:1;
    unsigned TRISD8:1;
    unsigned TRISD9:1;
    unsigned TRISD10:1;
    unsigned TRISD11:1;
    unsigned TRISD12:1;
    unsigned TRISD13:1;
    unsigned TRISD14:1;
    unsigned TRISD15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISDbits_t;
extern volatile __TRISDbits_t TRISDbits __asm__ ("TRISD") __attribute__((section("sfrs")));
extern volatile unsigned int TRISDCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISDSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISDINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RD0:1;
    unsigned RD1:1;
    unsigned RD2:1;
    unsigned RD3:1;
    unsigned RD4:1;
    unsigned RD5:1;
    unsigned RD6:1;
    unsigned RD7:1;
    unsigned RD8:1;
    unsigned RD9:1;
    unsigned RD10:1;
    unsigned RD11:1;
    unsigned RD12:1;
    unsigned RD13:1;
    unsigned RD14:1;
    unsigned RD15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTDbits_t;
extern volatile __PORTDbits_t PORTDbits __asm__ ("PORTD") __attribute__((section("sfrs")));
extern volatile unsigned int PORTDCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTDSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTDINV __attribute__((section("sfrs")));
extern volatile unsigned int LATD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATD0:1;
    unsigned LATD1:1;
    unsigned LATD2:1;
    unsigned LATD3:1;
    unsigned LATD4:1;
    unsigned LATD5:1;
    unsigned LATD6:1;
    unsigned LATD7:1;
    unsigned LATD8:1;
    unsigned LATD9:1;
    unsigned LATD10:1;
    unsigned LATD11:1;
    unsigned LATD12:1;
    unsigned LATD13:1;
    unsigned LATD14:1;
    unsigned LATD15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATDbits_t;
extern volatile __LATDbits_t LATDbits __asm__ ("LATD") __attribute__((section("sfrs")));
extern volatile unsigned int LATDCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATDSET __attribute__((section("sfrs")));
extern volatile unsigned int LATDINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCD __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCD0:1;
    unsigned ODCD1:1;
    unsigned ODCD2:1;
    unsigned ODCD3:1;
    unsigned ODCD4:1;
    unsigned ODCD5:1;
    unsigned ODCD6:1;
    unsigned ODCD7:1;
    unsigned ODCD8:1;
    unsigned ODCD9:1;
    unsigned ODCD10:1;
    unsigned ODCD11:1;
    unsigned ODCD12:1;
    unsigned ODCD13:1;
    unsigned ODCD14:1;
    unsigned ODCD15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCDbits_t;
extern volatile __ODCDbits_t ODCDbits __asm__ ("ODCD") __attribute__((section("sfrs")));
extern volatile unsigned int ODCDCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCDSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCDINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISE0:1;
    unsigned TRISE1:1;
    unsigned TRISE2:1;
    unsigned TRISE3:1;
    unsigned TRISE4:1;
    unsigned TRISE5:1;
    unsigned TRISE6:1;
    unsigned TRISE7:1;
    unsigned TRISE8:1;
    unsigned TRISE9:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISEbits_t;
extern volatile __TRISEbits_t TRISEbits __asm__ ("TRISE") __attribute__((section("sfrs")));
extern volatile unsigned int TRISECLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISESET __attribute__((section("sfrs")));
extern volatile unsigned int TRISEINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RE0:1;
    unsigned RE1:1;
    unsigned RE2:1;
    unsigned RE3:1;
    unsigned RE4:1;
    unsigned RE5:1;
    unsigned RE6:1;
    unsigned RE7:1;
    unsigned RE8:1;
    unsigned RE9:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTEbits_t;
extern volatile __PORTEbits_t PORTEbits __asm__ ("PORTE") __attribute__((section("sfrs")));
extern volatile unsigned int PORTECLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTESET __attribute__((section("sfrs")));
extern volatile unsigned int PORTEINV __attribute__((section("sfrs")));
extern volatile unsigned int LATE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATE0:1;
    unsigned LATE1:1;
    unsigned LATE2:1;
    unsigned LATE3:1;
    unsigned LATE4:1;
    unsigned LATE5:1;
    unsigned LATE6:1;
    unsigned LATE7:1;
    unsigned LATE8:1;
    unsigned LATE9:1;
  };
  struct {
    unsigned w:32;
  };
} __LATEbits_t;
extern volatile __LATEbits_t LATEbits __asm__ ("LATE") __attribute__((section("sfrs")));
extern volatile unsigned int LATECLR __attribute__((section("sfrs")));
extern volatile unsigned int LATESET __attribute__((section("sfrs")));
extern volatile unsigned int LATEINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCE0:1;
    unsigned ODCE1:1;
    unsigned ODCE2:1;
    unsigned ODCE3:1;
    unsigned ODCE4:1;
    unsigned ODCE5:1;
    unsigned ODCE6:1;
    unsigned ODCE7:1;
    unsigned ODCE8:1;
    unsigned ODCE9:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCEbits_t;
extern volatile __ODCEbits_t ODCEbits __asm__ ("ODCE") __attribute__((section("sfrs")));
extern volatile unsigned int ODCECLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCESET __attribute__((section("sfrs")));
extern volatile unsigned int ODCEINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISF0:1;
    unsigned TRISF1:1;
    unsigned TRISF2:1;
    unsigned TRISF3:1;
    unsigned TRISF4:1;
    unsigned TRISF5:1;
    unsigned TRISF6:1;
    unsigned TRISF7:1;
    unsigned TRISF8:1;
    unsigned :3;
    unsigned TRISF12:1;
    unsigned TRISF13:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISFbits_t;
extern volatile __TRISFbits_t TRISFbits __asm__ ("TRISF") __attribute__((section("sfrs")));
extern volatile unsigned int TRISFCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISFSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISFINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RF0:1;
    unsigned RF1:1;
    unsigned RF2:1;
    unsigned RF3:1;
    unsigned RF4:1;
    unsigned RF5:1;
    unsigned RF6:1;
    unsigned RF7:1;
    unsigned RF8:1;
    unsigned :3;
    unsigned RF12:1;
    unsigned RF13:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTFbits_t;
extern volatile __PORTFbits_t PORTFbits __asm__ ("PORTF") __attribute__((section("sfrs")));
extern volatile unsigned int PORTFCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTFSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTFINV __attribute__((section("sfrs")));
extern volatile unsigned int LATF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATF0:1;
    unsigned LATF1:1;
    unsigned LATF2:1;
    unsigned LATF3:1;
    unsigned LATF4:1;
    unsigned LATF5:1;
    unsigned LATF6:1;
    unsigned LATF7:1;
    unsigned LATF8:1;
    unsigned :3;
    unsigned LATF12:1;
    unsigned LATF13:1;
  };
  struct {
    unsigned w:32;
  };
} __LATFbits_t;
extern volatile __LATFbits_t LATFbits __asm__ ("LATF") __attribute__((section("sfrs")));
extern volatile unsigned int LATFCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATFSET __attribute__((section("sfrs")));
extern volatile unsigned int LATFINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCF __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCF0:1;
    unsigned ODCF1:1;
    unsigned ODCF2:1;
    unsigned ODCF3:1;
    unsigned ODCF4:1;
    unsigned ODCF5:1;
    unsigned ODCF6:1;
    unsigned ODCF7:1;
    unsigned ODCF8:1;
    unsigned :3;
    unsigned ODCF12:1;
    unsigned ODCF13:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCFbits_t;
extern volatile __ODCFbits_t ODCFbits __asm__ ("ODCF") __attribute__((section("sfrs")));
extern volatile unsigned int ODCFCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCFSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCFINV __attribute__((section("sfrs")));
extern volatile unsigned int TRISG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned TRISG0:1;
    unsigned TRISG1:1;
    unsigned TRISG2:1;
    unsigned TRISG3:1;
    unsigned :2;
    unsigned TRISG6:1;
    unsigned TRISG7:1;
    unsigned TRISG8:1;
    unsigned TRISG9:1;
    unsigned :2;
    unsigned TRISG12:1;
    unsigned TRISG13:1;
    unsigned TRISG14:1;
    unsigned TRISG15:1;
  };
  struct {
    unsigned w:32;
  };
} __TRISGbits_t;
extern volatile __TRISGbits_t TRISGbits __asm__ ("TRISG") __attribute__((section("sfrs")));
extern volatile unsigned int TRISGCLR __attribute__((section("sfrs")));
extern volatile unsigned int TRISGSET __attribute__((section("sfrs")));
extern volatile unsigned int TRISGINV __attribute__((section("sfrs")));
extern volatile unsigned int PORTG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned RG0:1;
    unsigned RG1:1;
    unsigned RG2:1;
    unsigned RG3:1;
    unsigned :2;
    unsigned RG6:1;
    unsigned RG7:1;
    unsigned RG8:1;
    unsigned RG9:1;
    unsigned :2;
    unsigned RG12:1;
    unsigned RG13:1;
    unsigned RG14:1;
    unsigned RG15:1;
  };
  struct {
    unsigned w:32;
  };
} __PORTGbits_t;
extern volatile __PORTGbits_t PORTGbits __asm__ ("PORTG") __attribute__((section("sfrs")));
extern volatile unsigned int PORTGCLR __attribute__((section("sfrs")));
extern volatile unsigned int PORTGSET __attribute__((section("sfrs")));
extern volatile unsigned int PORTGINV __attribute__((section("sfrs")));
extern volatile unsigned int LATG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned LATG0:1;
    unsigned LATG1:1;
    unsigned LATG2:1;
    unsigned LATG3:1;
    unsigned :2;
    unsigned LATG6:1;
    unsigned LATG7:1;
    unsigned LATG8:1;
    unsigned LATG9:1;
    unsigned :2;
    unsigned LATG12:1;
    unsigned LATG13:1;
    unsigned LATG14:1;
    unsigned LATG15:1;
  };
  struct {
    unsigned w:32;
  };
} __LATGbits_t;
extern volatile __LATGbits_t LATGbits __asm__ ("LATG") __attribute__((section("sfrs")));
extern volatile unsigned int LATGCLR __attribute__((section("sfrs")));
extern volatile unsigned int LATGSET __attribute__((section("sfrs")));
extern volatile unsigned int LATGINV __attribute__((section("sfrs")));
extern volatile unsigned int ODCG __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned ODCG0:1;
    unsigned ODCG1:1;
    unsigned ODCG2:1;
    unsigned ODCG3:1;
    unsigned :2;
    unsigned ODCG6:1;
    unsigned ODCG7:1;
    unsigned ODCG8:1;
    unsigned ODCG9:1;
    unsigned :2;
    unsigned ODCG12:1;
    unsigned ODCG13:1;
    unsigned ODCG14:1;
    unsigned ODCG15:1;
  };
  struct {
    unsigned w:32;
  };
} __ODCGbits_t;
extern volatile __ODCGbits_t ODCGbits __asm__ ("ODCG") __attribute__((section("sfrs")));
extern volatile unsigned int ODCGCLR __attribute__((section("sfrs")));
extern volatile unsigned int ODCGSET __attribute__((section("sfrs")));
extern volatile unsigned int ODCGINV __attribute__((section("sfrs")));
extern volatile unsigned int CNCON __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned :13;
    unsigned SIDL:1;
    unsigned FRZ:1;
    unsigned ON:1;
  };
  struct {
    unsigned w:32;
  };
} __CNCONbits_t;
extern volatile __CNCONbits_t CNCONbits __asm__ ("CNCON") __attribute__((section("sfrs")));
extern volatile unsigned int CNCONCLR __attribute__((section("sfrs")));
extern volatile unsigned int CNCONSET __attribute__((section("sfrs")));
extern volatile unsigned int CNCONINV __attribute__((section("sfrs")));
extern volatile unsigned int CNEN __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNEN0:1;
    unsigned CNEN1:1;
    unsigned CNEN2:1;
    unsigned CNEN3:1;
    unsigned CNEN4:1;
    unsigned CNEN5:1;
    unsigned CNEN6:1;
    unsigned CNEN7:1;
    unsigned CNEN8:1;
    unsigned CNEN9:1;
    unsigned CNEN10:1;
    unsigned CNEN11:1;
    unsigned CNEN12:1;
    unsigned CNEN13:1;
    unsigned CNEN14:1;
    unsigned CNEN15:1;
    unsigned CNEN16:1;
    unsigned CNEN17:1;
    unsigned CNEN18:1;
    unsigned CNEN19:1;
    unsigned CNEN20:1;
    unsigned CNEN21:1;
  };
  struct {
    unsigned w:32;
  };
} __CNENbits_t;
extern volatile __CNENbits_t CNENbits __asm__ ("CNEN") __attribute__((section("sfrs")));
extern volatile unsigned int CNENCLR __attribute__((section("sfrs")));
extern volatile unsigned int CNENSET __attribute__((section("sfrs")));
extern volatile unsigned int CNENINV __attribute__((section("sfrs")));
extern volatile unsigned int CNPUE __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned CNPUE0:1;
    unsigned CNPUE1:1;
    unsigned CNPUE2:1;
    unsigned CNPUE3:1;
    unsigned CNPUE4:1;
    unsigned CNPUE5:1;
    unsigned CNPUE6:1;
    unsigned CNPUE7:1;
    unsigned CNPUE8:1;
    unsigned CNPUE9:1;
    unsigned CNPUE10:1;
    unsigned CNPUE11:1;
    unsigned CNPUE12:1;
    unsigned CNPUE13:1;
    unsigned CNPUE14:1;
    unsigned CNPUE15:1;
    unsigned CNPUE16:1;
    unsigned CNPUE17:1;
    unsigned CNPUE18:1;
    unsigned CNPUE19:1;
    unsigned CNPUE20:1;
    unsigned CNPUE21:1;
  };
  struct {
    unsigned w:32;
  };
} __CNPUEbits_t;
extern volatile __CNPUEbits_t CNPUEbits __asm__ ("CNPUE") __attribute__((section("sfrs")));
extern volatile unsigned int CNPUECLR __attribute__((section("sfrs")));
extern volatile unsigned int CNPUESET __attribute__((section("sfrs")));
extern volatile unsigned int CNPUEINV __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG3 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned USERID:16;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG3bits_t;
extern volatile __DEVCFG3bits_t DEVCFG3bits __asm__ ("DEVCFG3") __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG2 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FPLLIDIV:3;
    unsigned :1;
    unsigned FPLLMUL:3;
    unsigned :1;
    unsigned UPLLIDIV:3;
    unsigned :4;
    unsigned UPLLEN:1;
    unsigned FPLLODIV:3;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG2bits_t;
extern volatile __DEVCFG2bits_t DEVCFG2bits __asm__ ("DEVCFG2") __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG1 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FNOSC:3;
    unsigned :2;
    unsigned FSOSCEN:1;
    unsigned :1;
    unsigned IESO:1;
    unsigned POSCMOD:2;
    unsigned OSCIOFNC:1;
    unsigned :1;
    unsigned FPBDIV:2;
    unsigned FCKSM:2;
    unsigned WDTPS:5;
    unsigned :2;
    unsigned FWDTEN:1;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG1bits_t;
extern volatile __DEVCFG1bits_t DEVCFG1bits __asm__ ("DEVCFG1") __attribute__((section("sfrs")));
extern volatile unsigned int DEVCFG0 __attribute__((section("sfrs")));
typedef union {
  struct {
    unsigned FDEBUG:2;
    unsigned :1;
    unsigned ICESEL:1;
    unsigned :8;
    unsigned PWP:12;
    unsigned BWP:1;
    unsigned :3;
    unsigned CP:1;
  };
  struct {
    unsigned w:32;
  };
} __DEVCFG0bits_t;
extern volatile __DEVCFG0bits_t DEVCFG0bits __asm__ ("DEVCFG0") __attribute__((section("sfrs")));
# 10973 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx360f512l.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/ppic32mx.h" 1 3
# 10974 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/proc/p32mx360f512l.h" 2 3
# 28 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 2 3
# 184 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
typedef unsigned long _reg_t;
# 386 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
extern unsigned int _xchsrspss (unsigned int);
# 401 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/cp0defs.h" 1 3
# 402 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/appio.h" 1 3
# 36 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/appio.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 1 3
# 37 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/appio.h" 2 3
# 403 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/p32xxxx.h" 2 3
# 45 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/adc10.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 1 3
# 48 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/attribs.h" 1 3
# 49 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 2 3


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int_3xx_4xx.h" 1 3
# 50 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int_3xx_4xx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_3xx_4xx_legacy.h" 1 3
# 51 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int_3xx_4xx.h" 2 3
# 62 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int_3xx_4xx.h" 3
typedef enum
{
    INT_CT = 0,
    INT_CS0,
    INT_CS1,

    INT_INT0,
    INT_INT1,
    INT_INT2,
    INT_INT3,
    INT_INT4,

    INT_T1,
    INT_T2,
    INT_T3,
    INT_T4,
    INT_T5,

    INT_IC1,
    INT_IC2,
    INT_IC3,
    INT_IC4,
    INT_IC5,

    INT_OC1,
    INT_OC2,
    INT_OC3,
    INT_OC4,
    INT_OC5,

    INT_CN,

    INT_SPI1E,
    INT_SPI2E,
    INT_SPI1TX,
    INT_SPI2TX,
    INT_SPI1RX,
    INT_SPI2RX,
    INT_SPI1,
    INT_SPI2,

    INT_U1E,
    INT_U2E,
    INT_U1RX,
    INT_U2RX,
    INT_U1TX,
    INT_U2TX,
    INT_UART1,
    INT_UART2,

    INT_I2C1B,
    INT_I2C2B,
    INT_I2C1S,
    INT_I2C2S,
    INT_I2C1M,
    INT_I2C2M,
    INT_I2C1,
    INT_I2C2,

    INT_AD1,

    INT_PMP,

    INT_CMP1,
    INT_CMP2,

    INT_FSCM,

    INT_FCE,

    INT_RTCC,

    INT_DMA0,
    INT_DMA1,
    INT_DMA2,
    INT_DMA3,
    INT_DMA4,
    INT_DMA5,
    INT_DMA6,
    INT_DMA7,

    INT_USB,

    INT_NUM
}INT_SOURCE;
# 186 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int_3xx_4xx.h" 3
typedef enum
{
    INT_CORE_TIMER_VECTOR,

    INT_CORE_SOFTWARE_0_VECTOR,
    INT_CORE_SOFTWARE_1_VECTOR,

    INT_EXTERNAL_0_VECTOR,
    INT_EXTERNAL_1_VECTOR,
    INT_EXTERNAL_2_VECTOR,
    INT_EXTERNAL_3_VECTOR,
    INT_EXTERNAL_4_VECTOR,

    INT_TIMER_1_VECTOR,
    INT_TIMER_2_VECTOR,
    INT_TIMER_3_VECTOR,
    INT_TIMER_4_VECTOR,
    INT_TIMER_5_VECTOR,

    INT_INPUT_CAPTURE_1_VECTOR,
    INT_INPUT_CAPTURE_2_VECTOR,
    INT_INPUT_CAPTURE_3_VECTOR,
    INT_INPUT_CAPTURE_4_VECTOR,
    INT_INPUT_CAPTURE_5_VECTOR,

    INT_OUTPUT_COMPARE_1_VECTOR,
    INT_OUTPUT_COMPARE_2_VECTOR,
    INT_OUTPUT_COMPARE_3_VECTOR,
    INT_OUTPUT_COMPARE_4_VECTOR,
    INT_OUTPUT_COMPARE_5_VECTOR,

    INT_SPI_1_VECTOR,
    INT_SPI_2_VECTOR,

    INT_UART_1_VECTOR,
    INT_UART_2_VECTOR,

    INT_I2C_1_VECTOR,
    INT_I2C_2_VECTOR,

    INT_CHANGE_NOTICE_VECTOR,
    INT_ADC_VECTOR,
    INT_PMP_VECTOR,

    INT_COMPARATOR_1_VECTOR,
    INT_COMPARATOR_2_VECTOR,

    INT_FAIL_SAFE_MONITOR_VECTOR,
    INT_RTCC_VECTOR,

    INT_DMA_0_VECTOR,
    INT_DMA_1_VECTOR,
    INT_DMA_2_VECTOR,
    INT_DMA_3_VECTOR,
    INT_DMA_4_VECTOR,
    INT_DMA_5_VECTOR,
    INT_DMA_6_VECTOR,
    INT_DMA_7_VECTOR,

    INT_FCE_VECTOR,

    INT_USB_1_VECTOR,


}INT_VECTOR;
# 52 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 2 3
# 63 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 1 3
# 54 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 3
void __attribute__ ((nomips16)) INTEnableSystemMultiVectoredInt(void);
# 68 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 3
void __attribute__ ((nomips16)) INTEnableSystemSingleVectoredInt(void);
# 423 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 3
void __attribute__((nomips16)) SetCoreSW0(void);
# 454 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 3
void __attribute__((nomips16)) SetCoreSW1(void);
# 488 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 3
void __attribute__((nomips16)) ClearCoreSW0(void);
# 522 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/int_legacy.h" 3
void __attribute__((nomips16)) ClearCoreSW1(void);
# 64 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 2 3
# 81 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_REGISTOR_SET_SELECT_NONE = 0 ,

    INT_REGISTOR_SET_SELECT_SS0 = (0x00008000)

}INT_SV_SS;
# 100 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_PRIORITY_DISABLED = 0 ,

    INT_PRIORITY_LEVEL_1 = 1 ,

    INT_PRIORITY_LEVEL_2 = 2 ,

    INT_PRIORITY_LEVEL_3 = 3 ,

    INT_PRIORITY_LEVEL_4 = 4 ,

    INT_PRIORITY_LEVEL_5 = 5 ,

    INT_PRIORITY_LEVEL_6 = 6 ,

    INT_PRIORITY_LEVEL_7 = 7
}INT_PRIORITY;
# 130 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_SUB_PRIORITY_LEVEL_0 = 0 ,

    INT_SUB_PRIORITY_LEVEL_1 = 1 ,

    INT_SUB_PRIORITY_LEVEL_2 = 2 ,

    INT_SUB_PRIORITY_LEVEL_3 = 3
}INT_SUB_PRIORITY;
# 151 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_DISABLED = 0 ,

    INT_ENABLED = 1
}INT_EN_DIS;
# 167 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_TPC_DISABLE = 0x00000700 ,

    INT_TPC_GROUP_PRI_LEVEL_1 = 1 ,

    INT_TPC_GROUP_PRI_LEVEL_2 = 2 ,

    INT_TPC_GROUP_PRI_LEVEL_3 = 3 ,

    INT_TPC_GROUP_PRI_LEVEL_4 = 4 ,

    INT_TPC_GROUP_PRI_LEVEL_5 = 5 ,

    INT_TPC_GROUP_PRI_LEVEL_6 = 6 ,

    INT_TPC_GROUP_PRI_LEVEL_7 = 7
}INT_TPC_GROUP;
# 196 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_VS_32 = 32 ,

    INT_VS_64 = 64 ,

    INT_VS_128 = 128 ,

    INT_VS_256 = 256 ,

    INT_VS_512 = 512
}INT_VS;
# 219 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
typedef enum
{

    INT_SYSTEM_CONFIG_MULT_VECTOR,

    INT_SYSTEM_CONFIG_SINGLE_VECTOR
}INT_SYSTEM_CONFIG;
# 263 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
unsigned int __attribute__((nomips16)) INTDisableInterrupts(void);
# 295 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
unsigned int __attribute__((nomips16)) INTEnableInterrupts(void);
# 330 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) INTRestoreInterrupts(unsigned int status);
# 380 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__ ((nomips16)) INTConfigureSystem(INT_SYSTEM_CONFIG config);
# 412 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) INTSetEBASE(unsigned int ebase_address);
# 442 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) INTSetVectorSpacing(INT_VS vector_spacing);
# 472 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline void __attribute__ ((always_inline)) INTSingleVectorRegisterSet(INT_SV_SS reg_set)
{
    INTCONCLR = reg_set;
    INTCONSET = reg_set;
}
# 512 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline unsigned int __attribute__ ((always_inline)) INTGetInterruptVectorNumber(void)
{
    return (unsigned int)(INTSTATbits.VEC);
}
# 545 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline INT_PRIORITY __attribute__ ((always_inline)) INTGetInterruptVectorPriority(void)
{
    return (INT_PRIORITY)(INTSTATbits.SRIPL);
}
# 587 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline void __attribute__ ((always_inline)) INTGetInterruptVectorNumberAndPriority(unsigned int *number, INT_PRIORITY *priority)
{
    *number = INTSTAT;
    *priority = (INT_PRIORITY)((*number >> 8) & 7);
    *number &= 0x3F;
}
# 621 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void INTClearFlag(INT_SOURCE source);
# 651 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void INTSetFlag(INT_SOURCE source);
# 684 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
unsigned int INTGetFlag(INT_SOURCE source);
# 714 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void INTEnable(INT_SOURCE source, INT_EN_DIS enable);
# 747 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
unsigned int INTGetEnable(INT_SOURCE source);
# 777 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void INTSetVectorPriority(INT_VECTOR vector, INT_PRIORITY priority);
# 808 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
INT_PRIORITY INTGetVectorPriority(INT_VECTOR vector);
# 838 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void INTSetVectorSubPriority(INT_VECTOR vector, INT_SUB_PRIORITY subPriority);
# 869 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
INT_SUB_PRIORITY INTGetVectorSubPriority(INT_VECTOR vector);
# 899 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline void __attribute__ ((always_inline)) INTSetIntProximityTimerReload(unsigned int time)
{
    IPTMR = time;
}
# 932 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline unsigned int __attribute__ ((always_inline)) INTGetIntProximityTimer(void)
{
    return IPTMR;
}
# 963 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline void __attribute__ ((always_inline)) INTSetFreeze(void)
{
    INTCONSET = 0x00004000L;
}
# 994 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline void __attribute__ ((always_inline)) INTClearFreeze(void)
{
    INTCONCLR = 0x00004000L;
}
# 1025 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
extern inline void __attribute__ ((always_inline)) INTSetTemporalProximityControl(INT_TPC_GROUP level)
{
    INTCONCLR = INT_TPC_DISABLE;

    if(level != INT_TPC_DISABLE)
        INTCONSET = (level << 0x00000008);
}
# 1072 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) CoreSetSoftwareInterrupt0(void);
# 1103 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) CoreSetSoftwareInterrupt1(void);
# 1137 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) CoreClearSoftwareInterrupt0(void);
# 1171 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/int.h" 3
void __attribute__((nomips16)) CoreClearSoftwareInterrupt1(void);
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/adc10.h" 2 3
# 42 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/bmx.h" 1 3
# 43 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/cmp.h" 1 3
# 44 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/cvref.h" 1 3
# 45 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma.h" 1 3
# 40 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 1 3
# 55 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 typedef enum
 {
  DMA_CHANNEL0,

  DMA_CHANNEL1,

  DMA_CHANNEL2,

  DMA_CHANNEL3,
# 81 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DMA_CHANNELS
 }DmaChannel;



 typedef enum
 {
  DMA_CHN_PRI0,
  DMA_CHN_PRI1,
  DMA_CHN_PRI2,
  DMA_CHN_PRI3
 }DmaChannelPri;





 typedef enum
 {
  DMA_OPEN_DEFAULT = 0,
  DMA_OPEN_AUTO = 0x00000010,
  DMA_OPEN_CHAIN_LOW = (0x00000020|0x00000100),
  DMA_OPEN_CHAIN_HI = (0x00000020),
  DMA_OPEN_DET_EN = 0x00000040,
  DMA_OPEN_ENABLE = 0x00000080,
  DMA_OPEN_MATCH = 0x80000000,
 }DmaOpenFlags;


 typedef enum
 {
  DMA_EV_ERR = 0x1,
  DMA_EV_ABORT = 0x2,
  DMA_EV_CELL_DONE = 0x4,
  DMA_EV_BLOCK_DONE = 0x8,
  DMA_EV_DST_HALF = 0x10,
  DMA_EV_DST_FULL = 0x20,
  DMA_EV_SRC_HALF = 0x40,
  DMA_EV_SRC_FULL = 0x80,

  DMA_EV_ALL_EVNTS= (DMA_EV_ERR|DMA_EV_ABORT|DMA_EV_CELL_DONE|DMA_EV_BLOCK_DONE|DMA_EV_DST_HALF|
         DMA_EV_DST_FULL|DMA_EV_SRC_HALF|DMA_EV_SRC_FULL)
 }DmaEvFlags;


 typedef enum
 {
  DMA_TXFER_OK,
  DMA_TXFER_ADD_ERR,
  DMA_TXFER_ABORT,
  DMA_TXFER_BC_ERR,
  DMA_TXFER_CC_ERR,
  DMA_TXFER_TMO
 }DmaTxferRes;

 typedef enum
 {
  DMA_WAIT_NOT,
  DMA_WAIT_CELL,
  DMA_WAIT_BLOCK
 }DmaWaitMode;
# 181 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnOpen(DmaChannel chn, DmaChannelPri chPri, DmaOpenFlags oFlags);
# 200 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnEnable(DmaChannel chn);
# 219 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnDisable(DmaChannel chn);
# 250 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetTxfer(DmaChannel chn, const void* vSrcAdd, void* vDstAdd, int srcSize, int dstSize, int cellSize);
# 270 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetSrcAdd(DmaChannel chn, const void* vSrcAdd);
# 289 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetDstAdd(DmaChannel chn, void* vDstAdd);
# 309 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetMatchPattern(DmaChannel chn, int pattern);
# 328 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  int DmaChnGetMatchPattern(DmaChannel chn);
# 362 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaTxferRes DmaChnStartTxfer(DmaChannel chn, DmaWaitMode wMode, unsigned long retries);
# 381 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnForceTxfer(DmaChannel chn);
# 400 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnAbortTxfer(DmaChannel chn);
# 433 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetEvEnableFlags(DmaChannel chn, DmaEvFlags eFlags);
# 464 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnClrEvEnableFlags(DmaChannel chn, DmaEvFlags eFlags);
# 494 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnWriteEvEnableFlags(DmaChannel chn, DmaEvFlags eFlags);
# 522 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaEvFlags DmaChnGetEvEnableFlags(DmaChannel chn);
# 553 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnClrEvFlags(DmaChannel chn, DmaEvFlags eFlags);
# 581 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaEvFlags DmaChnGetEvFlags(DmaChannel chn);
# 616 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaTxferRes DmaChnMemcpy(void* s1, const void* s2, int n, DmaChannel chn, DmaChannelPri chPri);
# 647 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaTxferRes DmaChnStrcpy(char* s1, const char* s2, DmaChannel chn, DmaChannelPri chPri);
# 681 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaTxferRes DmaChnStrncpy(char* s1, const char* s2, int n, DmaChannel chn, DmaChannelPri chPri);
# 712 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaTxferRes DmaChnMemCrc(void* d, const void* s, int n, DmaChannel chn, DmaChannelPri chPri);
# 750 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcConfigure(unsigned int polynomial, int pLen, unsigned int seed)
 {
  DCRCCONCLR=0x00000F00;
  DCRCCONSET=(pLen-1)<<0x00000008;
  DCRCDATA=seed;
  DCRCXOR=polynomial;
 }
# 781 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void CrcAttachChannel(DmaChannel chn, int appendMode);
# 801 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  unsigned int CrcResult(void);







 typedef struct
 {
  union
  {
   struct
   {
    unsigned int chn: 3;
    unsigned int rdOp: 1;
   };
   unsigned int w;
  }lastAccess;
  void* lastAddress;
 }DmaStatus;

 typedef enum
 {
  DMA_GFLG_SUSPEND = 0x00001000,
  DMA_GFLG_SIDL = 0x00002000,
  DMA_GFLG_FRZ = 0x00004000,
  DMA_GFLG_ON = 0x00008000,

  DMA_GFLG_ALL_FLAGS= DMA_GFLG_SUSPEND|DMA_GFLG_SIDL|DMA_GFLG_FRZ|DMA_GFLG_ON
 }DmaGlblFlags;




 typedef enum
 {
  DMA_EV_ABORT_IRQ_EN = 0x00000008,
  DMA_EV_START_IRQ_EN = 0x00000010,


  DMA_EV_MATCH_EN = 0x00000020,



        _DMA_EV_MAX_MASK = 0x00FF0000,
 }DmaEvCtrlFlags;
# 858 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 typedef enum
 {
  DMA_CTL_AUTO_EN = 0x00000010,
  DMA_CTL_CHAIN_EN = 0x00000020,
  DMA_CTL_DET_EN = 0x00000040,
  DMA_CTL_CHN_EN = 0x00000080,
  DMA_CTL_CHAIN_DIR = 0x00000100,


 }DmaChnCtrlFlags;






 typedef struct
 {
  void* vSrcAdd;
  void* vDstAdd;
  int srcSize;
  int dstSize;
  int cellSize;
 }DmaTxferCtrl;
# 908 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaEnable(int enable)
 {
  if(enable)
  {
   DMACONSET=0x00008000;
  }
  else
  {
   DMACONCLR=0x00008000;
   while(DMACONbits.ON);
  }
 }
# 959 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
    extern __inline__ int __attribute__((always_inline)) DmaSuspend(void)
 {
  int suspSt;
  if(!(suspSt=DMACONbits.SUSPEND))
  {
   DMACONSET=0x00001000;
   while(!(DMACONbits.SUSPEND));
  }
  return suspSt;
 }
# 989 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaResume(int susp)
 {
  if(susp)
  {
   DmaSuspend();
  }
  else
  {
   DMACONCLR=0x00001000;
  }
 }
# 1023 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaGetStatus(DmaStatus* pStat);
# 1049 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaSetGlobalFlags(DmaGlblFlags gFlags)
 {
  DMACONSET=gFlags;
 }
# 1078 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaClrGlobalFlags(DmaGlblFlags gFlags)
 {
  DMACONCLR=gFlags;
 }
# 1107 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaWriteGlobalFlags(DmaGlblFlags gFlags)
 {
  DMACON=gFlags;
 }
# 1133 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
        extern __inline__ DmaGlblFlags __attribute__((always_inline)) DmaGetGlobalFlags(void)
 {
  return (DmaGlblFlags)DMACON;
 }
# 1156 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ int __attribute__((always_inline)) DmaGetMaxTxferSize(void)
 {
  return 256;
 }




 typedef enum
 {
  DMA_CONFIG_DEFAULT = 0,
  DMA_CONFIG_AUTO = 0x00000010,
  DMA_CONFIG_CHAIN_LOW = (0x00000020|0x00000100),
  DMA_CONFIG_CHAIN_HI = (0x00000020),
  DMA_CONFIG_DET_EN = 0x00000040,
  DMA_CONFIG_ENABLE = 0x00000080,
  DMA_CONFIG_MATCH = 0x80000000,
 }DmaConfigFlags;
# 1210 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 void DmaChnConfigure(DmaChannel chn, DmaChannelPri chPri, DmaConfigFlags cFlags);
# 1231 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  int DmaChnGetSrcPnt(DmaChannel chn);
# 1251 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  int DmaChnGetDstPnt(DmaChannel chn);
# 1271 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  int DmaChnGetCellPnt(DmaChannel chn);
# 1307 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetEventControlFlags(DmaChannel chn, DmaEvCtrlFlags dmaEvCtrl);
# 1342 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnClrEventControlFlags(DmaChannel chn, DmaEvCtrlFlags dmaEvCtrl);
# 1378 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnWriteEventControlFlags(DmaChannel chn, DmaEvCtrlFlags dmaEvCtrl);
# 1449 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaEvCtrlFlags DmaChnGetEventControl(DmaChannel chn);
# 1485 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetControlFlags(DmaChannel chn, DmaChnCtrlFlags dmaChnCtrl);
# 1520 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnClrControlFlags(DmaChannel chn, DmaChnCtrlFlags dmaChnCtrl);
# 1554 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnWriteControlFlags(DmaChannel chn, DmaChnCtrlFlags dmaChnCtrl);
# 1621 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  DmaChnCtrlFlags DmaChnGetControlFlags(DmaChannel chn);
# 1642 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  int DmaChnGetEvDetect(DmaChannel chn);
# 1672 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnGetTxfer(DmaChannel chn, DmaTxferCtrl* pTxCtrl, int mapToK0);
# 1693 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcEnable(int enable)
 {
  if(enable)
  {
   DCRCCONSET=0x00000080;
  }
  else
  {
   DCRCCONCLR=0x00000080;
  }
 }
# 1725 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ int __attribute__((always_inline)) DmaCrcGetEnable(void)
 {
  return DCRCCONbits.CRCEN!=0;
 }
# 1752 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcAppendModeEnable(int enable)
 {
  if(enable)
  {
   DCRCCONSET=0x00000040;
  }
  else
  {
   DCRCCONCLR=0x00000040;
  }
 }
# 1783 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ int __attribute__((always_inline)) DmaCrcGetAppendMode(void)
 {
  return DCRCCONbits.CRCAPP!=0;
 }
# 1805 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcSetAttach(DmaChannel chn)
 {
  DCRCCONCLR=0x00000003;
  DCRCCONSET=chn;
 }
# 1828 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ DmaChannel __attribute__((always_inline)) DmaCrcGetAttach(void)
 {
  return (DmaChannel)DCRCCONbits.CRCCH;
 }
# 1851 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcSetPLen(int pLen)
 {
  DCRCCONCLR=0x00000F00;
  DCRCCONSET=(pLen)-1;
 }
# 1875 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ int __attribute__((always_inline)) DmaCrcGetPLen(void)
 {
  return DCRCCONbits.PLEN+1;
 }
# 1900 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcSetShiftFeedback(unsigned int feedback)
 {
  DCRCXOR=feedback;
 }
# 1925 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ unsigned int __attribute__((always_inline)) DmaCrcGetShiftFeedback(void)
 {
  return DCRCXOR;
 }
# 1948 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ void __attribute__((always_inline)) DmaCrcSetSeed(unsigned int seed)
 {
  DCRCDATA=seed;
 }
# 1970 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
 extern __inline__ unsigned int __attribute__((always_inline)) DmaCrcGetValue(void)
 {
  return DCRCDATA;
 }
# 2007 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnSetEvFlags(DmaChannel chn, DmaEvFlags eFlags);
# 2037 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
  void DmaChnWriteEvFlags(DmaChannel chn, DmaEvFlags eFlags);
# 2059 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaFreezeEnable(int enable)
 {
  if(enable)
  {
   DMACONSET=0x00004000;
  }
  else
  {
   DMACONCLR=0x00004000;
  }
 }
# 2080 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/dma_legacy.h" 1 3
# 48 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/dma_legacy.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma.h" 1 3
# 49 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/dma_legacy.h" 2 3
# 764 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/dma_legacy.h" 3
typedef enum
{

 DMA_REG_IX_CON,
 DMA_REG_IX_CON_CLR,
 DMA_REG_IX_CON_SET,
 DMA_REG_IX_CON_INV,

 DMA_REG_IX_ECON,
 DMA_REG_IX_ECON_CLR,
 DMA_REG_IX_ECON_SET,
 DMA_REG_IX_ECON_INV,

 DMA_REG_IX_INTR,
 DMA_REG_IX_INTR_CLR,
 DMA_REG_IX_INTR_SET,
 DMA_REG_IX_INTR_INV,

 DMA_REG_IX_SSA,
 DMA_REG_IX_SSA_CLR,
 DMA_REG_IX_SSA_SET,
 DMA_REG_IX_SSA_INV,

 DMA_REG_IX_DSA,
 DMA_REG_IX_DSA_CLR,
 DMA_REG_IX_DSA_SET,
 DMA_REG_IX_DSA_INV,

 DMA_REG_IX_SSIZ,
 DMA_REG_IX_SSIZ_CLR,
 DMA_REG_IX_SSIZ_SET,
 DMA_REG_IX_SSIZ_INV,

 DMA_REG_IX_DSIZ,
 DMA_REG_IX_DSIZ_CLR,
 DMA_REG_IX_DSIZ_SET,
 DMA_REG_IX_DSIZ_INV,

 DMA_REG_IX_SPTR,
 DMA_REG_IX_RESERVED0,
 DMA_REG_IX_RESERVED1,
 DMA_REG_IX_RESERVED2,

 DMA_REG_IX_DPTR,
 DMA_REG_IX_RESERVED3,
 DMA_REG_IX_RESERVED4,
 DMA_REG_IX_RESERVED5,

 DMA_REG_IX_CSIZ,
 DMA_REG_IX_CSIZ_CLR,
 DMA_REG_IX_CSIZ_SET,
 DMA_REG_IX_CSIZ_INV,

 DMA_REG_IX_CPTR,
 DMA_REG_IX_RESERVED6,
 DMA_REG_IX_RESERVED7,
 DMA_REG_IX_RESERVED8,

 DMA_REG_IX_DAT,
 DMA_REG_IX_DAT_CLR,
 DMA_REG_IX_DAT_SET,
 DMA_REG_IX_DAT_INV,
}DmaChnRegIx;
# 847 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/dma_legacy.h" 3
 void DmaChnSetRegister(DmaChannel chn, DmaChnRegIx regIx, unsigned int value);
# 868 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/dma_legacy.h" 3
 unsigned int DmaChnGetRegister(DmaChannel chn, DmaChnRegIx regIx);
# 2081 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma_3xx_4xx.h" 2 3
# 41 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/dma.h" 2 3
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 1 3
# 50 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/GenericTypeDefs.h" 1 3
# 65 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/GenericTypeDefs.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stddef.h" 1 3
# 75 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stddef.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/ansi.h" 1 3
# 76 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stddef.h" 2 3


typedef long unsigned int size_t;




typedef long int ptrdiff_t;







typedef int wchar_t;




typedef unsigned int wint_t;
# 66 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/GenericTypeDefs.h" 2 3

typedef enum _BOOL { FALSE = 0, TRUE } BOOL;
typedef enum _BIT { CLEAR = 0, SET } BIT;






typedef signed int INT;
typedef signed char INT8;
typedef signed short int INT16;
typedef signed long int INT32;



 __extension__ typedef signed long long INT64;



typedef unsigned int UINT;
typedef unsigned char UINT8;
typedef unsigned short int UINT16;




typedef unsigned long int UINT32;


 __extension__ typedef unsigned long long UINT64;


typedef union
{
    UINT8 Val;
    struct
    {
        __extension__ UINT8 b0:1;
        __extension__ UINT8 b1:1;
        __extension__ UINT8 b2:1;
        __extension__ UINT8 b3:1;
        __extension__ UINT8 b4:1;
        __extension__ UINT8 b5:1;
        __extension__ UINT8 b6:1;
        __extension__ UINT8 b7:1;
    } bits;
} UINT8_VAL, UINT8_BITS;

typedef union
{
    UINT16 Val;
    UINT8 v[2] ;
    struct
    {
        UINT8 LB;
        UINT8 HB;
    } byte;
    struct
    {
        __extension__ UINT8 b0:1;
        __extension__ UINT8 b1:1;
        __extension__ UINT8 b2:1;
        __extension__ UINT8 b3:1;
        __extension__ UINT8 b4:1;
        __extension__ UINT8 b5:1;
        __extension__ UINT8 b6:1;
        __extension__ UINT8 b7:1;
        __extension__ UINT8 b8:1;
        __extension__ UINT8 b9:1;
        __extension__ UINT8 b10:1;
        __extension__ UINT8 b11:1;
        __extension__ UINT8 b12:1;
        __extension__ UINT8 b13:1;
        __extension__ UINT8 b14:1;
        __extension__ UINT8 b15:1;
    } bits;
} UINT16_VAL, UINT16_BITS;
# 187 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/GenericTypeDefs.h" 3
typedef union
{
    UINT32 Val;
    UINT16 w[2] ;
    UINT8 v[4] ;
    struct
    {
        UINT16 LW;
        UINT16 HW;
    } word;
    struct
    {
        UINT8 LB;
        UINT8 HB;
        UINT8 UB;
        UINT8 MB;
    } byte;
    struct
    {
        UINT16_VAL low;
        UINT16_VAL high;
    }wordUnion;
    struct
    {
        __extension__ UINT8 b0:1;
        __extension__ UINT8 b1:1;
        __extension__ UINT8 b2:1;
        __extension__ UINT8 b3:1;
        __extension__ UINT8 b4:1;
        __extension__ UINT8 b5:1;
        __extension__ UINT8 b6:1;
        __extension__ UINT8 b7:1;
        __extension__ UINT8 b8:1;
        __extension__ UINT8 b9:1;
        __extension__ UINT8 b10:1;
        __extension__ UINT8 b11:1;
        __extension__ UINT8 b12:1;
        __extension__ UINT8 b13:1;
        __extension__ UINT8 b14:1;
        __extension__ UINT8 b15:1;
        __extension__ UINT8 b16:1;
        __extension__ UINT8 b17:1;
        __extension__ UINT8 b18:1;
        __extension__ UINT8 b19:1;
        __extension__ UINT8 b20:1;
        __extension__ UINT8 b21:1;
        __extension__ UINT8 b22:1;
        __extension__ UINT8 b23:1;
        __extension__ UINT8 b24:1;
        __extension__ UINT8 b25:1;
        __extension__ UINT8 b26:1;
        __extension__ UINT8 b27:1;
        __extension__ UINT8 b28:1;
        __extension__ UINT8 b29:1;
        __extension__ UINT8 b30:1;
        __extension__ UINT8 b31:1;
    } bits;
} UINT32_VAL;



typedef union
{
    UINT64 Val;
    UINT32 d[2] ;
    UINT16 w[4] ;
    UINT8 v[8] ;
    struct
    {
        UINT32 LD;
        UINT32 HD;
    } dword;
    struct
    {
        UINT16 LW;
        UINT16 HW;
        UINT16 UW;
        UINT16 MW;
    } word;
    struct
    {
        __extension__ UINT8 b0:1;
        __extension__ UINT8 b1:1;
        __extension__ UINT8 b2:1;
        __extension__ UINT8 b3:1;
        __extension__ UINT8 b4:1;
        __extension__ UINT8 b5:1;
        __extension__ UINT8 b6:1;
        __extension__ UINT8 b7:1;
        __extension__ UINT8 b8:1;
        __extension__ UINT8 b9:1;
        __extension__ UINT8 b10:1;
        __extension__ UINT8 b11:1;
        __extension__ UINT8 b12:1;
        __extension__ UINT8 b13:1;
        __extension__ UINT8 b14:1;
        __extension__ UINT8 b15:1;
        __extension__ UINT8 b16:1;
        __extension__ UINT8 b17:1;
        __extension__ UINT8 b18:1;
        __extension__ UINT8 b19:1;
        __extension__ UINT8 b20:1;
        __extension__ UINT8 b21:1;
        __extension__ UINT8 b22:1;
        __extension__ UINT8 b23:1;
        __extension__ UINT8 b24:1;
        __extension__ UINT8 b25:1;
        __extension__ UINT8 b26:1;
        __extension__ UINT8 b27:1;
        __extension__ UINT8 b28:1;
        __extension__ UINT8 b29:1;
        __extension__ UINT8 b30:1;
        __extension__ UINT8 b31:1;
        __extension__ UINT8 b32:1;
        __extension__ UINT8 b33:1;
        __extension__ UINT8 b34:1;
        __extension__ UINT8 b35:1;
        __extension__ UINT8 b36:1;
        __extension__ UINT8 b37:1;
        __extension__ UINT8 b38:1;
        __extension__ UINT8 b39:1;
        __extension__ UINT8 b40:1;
        __extension__ UINT8 b41:1;
        __extension__ UINT8 b42:1;
        __extension__ UINT8 b43:1;
        __extension__ UINT8 b44:1;
        __extension__ UINT8 b45:1;
        __extension__ UINT8 b46:1;
        __extension__ UINT8 b47:1;
        __extension__ UINT8 b48:1;
        __extension__ UINT8 b49:1;
        __extension__ UINT8 b50:1;
        __extension__ UINT8 b51:1;
        __extension__ UINT8 b52:1;
        __extension__ UINT8 b53:1;
        __extension__ UINT8 b54:1;
        __extension__ UINT8 b55:1;
        __extension__ UINT8 b56:1;
        __extension__ UINT8 b57:1;
        __extension__ UINT8 b58:1;
        __extension__ UINT8 b59:1;
        __extension__ UINT8 b60:1;
        __extension__ UINT8 b61:1;
        __extension__ UINT8 b62:1;
        __extension__ UINT8 b63:1;
    } bits;
} UINT64_VAL;





typedef void VOID;

typedef char CHAR8;
typedef unsigned char UCHAR8;

typedef unsigned char BYTE;
typedef unsigned short int WORD;
typedef unsigned long DWORD;

__extension__
typedef unsigned long long QWORD;
typedef signed char CHAR;
typedef signed short int SHORT;
typedef signed long LONG;

__extension__
typedef signed long long LONGLONG;
typedef union
{
    BYTE Val;
    struct
    {
        __extension__ BYTE b0:1;
        __extension__ BYTE b1:1;
        __extension__ BYTE b2:1;
        __extension__ BYTE b3:1;
        __extension__ BYTE b4:1;
        __extension__ BYTE b5:1;
        __extension__ BYTE b6:1;
        __extension__ BYTE b7:1;
    } bits;
} BYTE_VAL, BYTE_BITS;

typedef union
{
    WORD Val;
    BYTE v[2] ;
    struct
    {
        BYTE LB;
        BYTE HB;
    } byte;
    struct
    {
        __extension__ BYTE b0:1;
        __extension__ BYTE b1:1;
        __extension__ BYTE b2:1;
        __extension__ BYTE b3:1;
        __extension__ BYTE b4:1;
        __extension__ BYTE b5:1;
        __extension__ BYTE b6:1;
        __extension__ BYTE b7:1;
        __extension__ BYTE b8:1;
        __extension__ BYTE b9:1;
        __extension__ BYTE b10:1;
        __extension__ BYTE b11:1;
        __extension__ BYTE b12:1;
        __extension__ BYTE b13:1;
        __extension__ BYTE b14:1;
        __extension__ BYTE b15:1;
    } bits;
} WORD_VAL, WORD_BITS;

typedef union
{
    DWORD Val;
    WORD w[2] ;
    BYTE v[4] ;
    struct
    {
        WORD LW;
        WORD HW;
    } word;
    struct
    {
        BYTE LB;
        BYTE HB;
        BYTE UB;
        BYTE MB;
    } byte;
    struct
    {
        WORD_VAL low;
        WORD_VAL high;
    }wordUnion;
    struct
    {
        __extension__ BYTE b0:1;
        __extension__ BYTE b1:1;
        __extension__ BYTE b2:1;
        __extension__ BYTE b3:1;
        __extension__ BYTE b4:1;
        __extension__ BYTE b5:1;
        __extension__ BYTE b6:1;
        __extension__ BYTE b7:1;
        __extension__ BYTE b8:1;
        __extension__ BYTE b9:1;
        __extension__ BYTE b10:1;
        __extension__ BYTE b11:1;
        __extension__ BYTE b12:1;
        __extension__ BYTE b13:1;
        __extension__ BYTE b14:1;
        __extension__ BYTE b15:1;
        __extension__ BYTE b16:1;
        __extension__ BYTE b17:1;
        __extension__ BYTE b18:1;
        __extension__ BYTE b19:1;
        __extension__ BYTE b20:1;
        __extension__ BYTE b21:1;
        __extension__ BYTE b22:1;
        __extension__ BYTE b23:1;
        __extension__ BYTE b24:1;
        __extension__ BYTE b25:1;
        __extension__ BYTE b26:1;
        __extension__ BYTE b27:1;
        __extension__ BYTE b28:1;
        __extension__ BYTE b29:1;
        __extension__ BYTE b30:1;
        __extension__ BYTE b31:1;
    } bits;
} DWORD_VAL;


typedef union
{
    QWORD Val;
    DWORD d[2] ;
    WORD w[4] ;
    BYTE v[8] ;
    struct
    {
        DWORD LD;
        DWORD HD;
    } dword;
    struct
    {
        WORD LW;
        WORD HW;
        WORD UW;
        WORD MW;
    } word;
    struct
    {
        __extension__ BYTE b0:1;
        __extension__ BYTE b1:1;
        __extension__ BYTE b2:1;
        __extension__ BYTE b3:1;
        __extension__ BYTE b4:1;
        __extension__ BYTE b5:1;
        __extension__ BYTE b6:1;
        __extension__ BYTE b7:1;
        __extension__ BYTE b8:1;
        __extension__ BYTE b9:1;
        __extension__ BYTE b10:1;
        __extension__ BYTE b11:1;
        __extension__ BYTE b12:1;
        __extension__ BYTE b13:1;
        __extension__ BYTE b14:1;
        __extension__ BYTE b15:1;
        __extension__ BYTE b16:1;
        __extension__ BYTE b17:1;
        __extension__ BYTE b18:1;
        __extension__ BYTE b19:1;
        __extension__ BYTE b20:1;
        __extension__ BYTE b21:1;
        __extension__ BYTE b22:1;
        __extension__ BYTE b23:1;
        __extension__ BYTE b24:1;
        __extension__ BYTE b25:1;
        __extension__ BYTE b26:1;
        __extension__ BYTE b27:1;
        __extension__ BYTE b28:1;
        __extension__ BYTE b29:1;
        __extension__ BYTE b30:1;
        __extension__ BYTE b31:1;
        __extension__ BYTE b32:1;
        __extension__ BYTE b33:1;
        __extension__ BYTE b34:1;
        __extension__ BYTE b35:1;
        __extension__ BYTE b36:1;
        __extension__ BYTE b37:1;
        __extension__ BYTE b38:1;
        __extension__ BYTE b39:1;
        __extension__ BYTE b40:1;
        __extension__ BYTE b41:1;
        __extension__ BYTE b42:1;
        __extension__ BYTE b43:1;
        __extension__ BYTE b44:1;
        __extension__ BYTE b45:1;
        __extension__ BYTE b46:1;
        __extension__ BYTE b47:1;
        __extension__ BYTE b48:1;
        __extension__ BYTE b49:1;
        __extension__ BYTE b50:1;
        __extension__ BYTE b51:1;
        __extension__ BYTE b52:1;
        __extension__ BYTE b53:1;
        __extension__ BYTE b54:1;
        __extension__ BYTE b55:1;
        __extension__ BYTE b56:1;
        __extension__ BYTE b57:1;
        __extension__ BYTE b58:1;
        __extension__ BYTE b59:1;
        __extension__ BYTE b60:1;
        __extension__ BYTE b61:1;
        __extension__ BYTE b62:1;
        __extension__ BYTE b63:1;
    } bits;
} QWORD_VAL;
# 51 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 2 3


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 1 3
# 557 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 void IdleI2C1( void );



 void IdleI2C2( void );
# 583 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned char MasterReadI2C1( void );



 unsigned char MasterReadI2C2( void );
# 609 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned int MasterWriteI2C1( unsigned char data );



 unsigned int MasterWriteI2C2( unsigned char data );
# 639 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned int MastergetsI2C1( unsigned int length, unsigned char *data,
                                    unsigned int I2cDataWait );



 unsigned int MastergetsI2C2( unsigned int length, unsigned char *data,
                                    unsigned int I2cDataWait );
# 667 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned int MasterputsI2C1( unsigned char *data );



 unsigned int MasterputsI2C2( unsigned char *data );
# 693 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned char SlaveReadI2C1( void );



 unsigned char SlaveReadI2C2( void );
# 718 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 void SlaveWriteI2C1( unsigned char data );



 void SlaveWriteI2C2( unsigned char data );
# 745 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned int SlavegetsI2C1( unsigned char *data,
                                   unsigned int I2cDataWait );



 unsigned int SlavegetsI2C2( unsigned char *data,
                                   unsigned int I2cDataWait );
# 773 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/i2c_legacy.h" 3
 unsigned int SlaveputsI2C1( unsigned char *data );



 unsigned int SlaveputsI2C2( unsigned char *data );
# 54 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 2 3
# 79 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef enum
{


    I2C1,




    I2C2,
# 107 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
    I2C_NUMBER_OF_MODULES

} I2C_MODULE;
# 122 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef union
{


    UINT8 byte;

    struct
    {

        UINT8 rw : 1;


        UINT8 address : 7;
    };

} I2C_7_BIT_ADDRESS;
# 150 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef union
{

    UINT16 both_bytes;

    struct
    {

        BYTE first_byte;


        BYTE second_byte;
    };

    struct
    {

        UINT16 rw : 1;


        UINT16 high_bits : 2;


        UINT16 const_bits : 5;


        UINT16 low_bits : 8;
    };

} I2C_10_BIT_ADDRESS;
# 270 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef enum
{

    I2C_SUCCESS = 0,


    I2C_ERROR,


    I2C_MASTER_BUS_COLLISION,



    I2C_RECEIVE_OVERFLOW

} I2C_RESULT;
# 304 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef enum
{


    I2C_ENABLE_SLAVE_CLOCK_STRETCHING
                             = 0x00000040 ,



    I2C_ENABLE_SMB_SUPPORT
                             = 0x00000100 ,


    I2C_ENABLE_HIGH_SPEED
                             = 0x00000200 ,


    I2C_STOP_IN_IDLE
                             = 0x00002000

} I2C_CONFIGURATION;
# 342 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef enum
{

    I2C_USE_7BIT_ADDRESS
                             = 0x00000000 ,


    I2C_USE_10BIT_ADDRESS
                             = 0x00000400 ,



    I2C_ENABLE_GENERAL_CALL_ADDRESS
                             = 0x00000080 ,



    I2C_USE_RESERVED_ADDRESSES
                             = 0x00000800

} I2C_ADDRESS_MODE;
# 381 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
typedef enum
{


    I2C_TRANSMITTER_FULL
                             = 0x00000001 ,



    I2C_DATA_AVAILABLE
                            = 0x00000002 ,




    I2C_SLAVE_READ
                             = 0x00000004 ,


    I2C_START
                             = 0x00000008 ,


    I2C_STOP
                             = 0x00000010 ,



    I2C_SLAVE_DATA
                             = 0x00000020 ,



    I2C_RECEIVER_OVERFLOW
                             = 0x00000040 ,



    I2C_TRANSMITTER_OVERFLOW
                             = 0x00000080 ,



    I2C_10BIT_ADDRESS
                             = 0x00000100 ,


    I2C_GENERAL_CALL
                             = 0x00000200 ,



    I2C_ARBITRATION_LOSS
                             = 0x00000400 ,


    I2C_TRANSMITTER_BUSY
                             = 0x00004000 ,


    I2C_BYTE_ACKNOWLEDGED
                             = 0x00008000

} I2C_STATUS;
# 717 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CEnable( I2C_MODULE id, BOOL enable );
# 754 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CConfigure ( I2C_MODULE id, I2C_CONFIGURATION flags );
# 798 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
UINT32 I2CSetFrequency ( I2C_MODULE id, UINT32 sourceClock, UINT32 i2cClock );
# 851 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CSetSlaveAddress ( I2C_MODULE id, UINT16 address, UINT16 mask, I2C_ADDRESS_MODE flags );
# 891 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CBusIsIdle( I2C_MODULE id );
# 930 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
I2C_RESULT I2CStart( I2C_MODULE id );
# 967 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
I2C_RESULT I2CRepeatStart ( I2C_MODULE id );
# 1001 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CStop ( I2C_MODULE id );
# 1040 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CTransmitterIsReady ( I2C_MODULE id );
# 1082 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
I2C_RESULT I2CSendByte ( I2C_MODULE id, BYTE data );
# 1125 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CTransmissionHasCompleted ( I2C_MODULE id );
# 1168 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CByteWasAcknowledged ( I2C_MODULE id );
# 1209 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
I2C_RESULT I2CReceiverEnable ( I2C_MODULE id, BOOL enable );
# 1247 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CReceivedDataIsAvailable ( I2C_MODULE id );
# 1293 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CReceivedByteIsAnAddress ( I2C_MODULE id );
# 1331 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BYTE I2CGetByte ( I2C_MODULE id );
# 1373 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CAcknowledgeByte ( I2C_MODULE id, BOOL ack );
# 1415 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CAcknowledgeHasCompleted ( I2C_MODULE id );
# 1460 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
BOOL I2CSlaveDataReadRequested ( I2C_MODULE id );
# 1494 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CSlaveClockHold ( I2C_MODULE id );
# 1530 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CSlaveClockRelease ( I2C_MODULE id );
# 1568 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
I2C_STATUS I2CGetStatus ( I2C_MODULE id );
# 1608 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/i2c.h" 3
void I2CClearStatus ( I2C_MODULE id, I2C_STATUS status );
# 47 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/incap.h" 1 3
# 339 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/incap.h" 3
 void ReadCapture1(unsigned int * buffer);



 void ReadCapture2(unsigned int * buffer);



 void ReadCapture3(unsigned int * buffer);



 void ReadCapture4(unsigned int * buffer);



 void ReadCapture5(unsigned int * buffer);
# 48 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3

# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 1 3
# 44 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/kmem.h" 1 3
# 21 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/kmem.h" 3
typedef unsigned long _paddr_t;
typedef unsigned long _vaddr_t;
# 45 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 2 3
# 69 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 3
unsigned int NVMProgram(void * address, const void * data, unsigned int size, void* pagebuff);
# 87 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 3
unsigned int NVMWriteWord(void* address, unsigned int data);
# 106 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 3
unsigned int NVMWriteRow(void* address, void* data);
# 124 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 3
unsigned int NVMErasePage(void* address);
# 140 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/nvm.h" 3
unsigned int NVMClearError(void);
# 50 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/outcompare.h" 1 3
# 51 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pcache.h" 1 3
# 377 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pcache.h" 3
void __attribute__ ((nomips16)) CheKseg0CacheOff();
# 392 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pcache.h" 3
void __attribute__ ((nomips16)) CheKseg0CacheOn();
# 52 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 1 3
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
typedef enum {BUF0, BUF1, BUF2, BUF3}BUFFER ;
# 310 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
extern inline void __attribute__((always_inline)) PMPSetAddress(unsigned int addrs)
{
    while((PMMODEbits.BUSY));
    PMADDR = addrs;
}
# 391 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
extern inline unsigned int __attribute__((always_inline)) PMPMasterRead(void)
{
 while((PMMODEbits.BUSY));
 return(PMDIN);
}
# 420 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPMasterReadByteBlock(unsigned int addrs, unsigned int bytes, unsigned char* pDest);
# 445 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPMasterReadWordBlock(unsigned int addrs, unsigned int words, unsigned short* pDest);
# 472 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
extern inline void __attribute__((always_inline)) PMPMasterWrite(unsigned short value)
{
 while((PMMODEbits.BUSY));
 PMDIN = value;
}
# 501 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPMasterWriteByteBlock(unsigned int addrs, unsigned int bytes, unsigned char* source);
# 526 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPMasterWriteWordBlock(unsigned int addrs, unsigned int words, unsigned short* source);
# 547 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
unsigned char PMPSlaveReadBuffer(BUFFER);
# 569 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPSlaveReadBuffers(unsigned char* pDest);
# 594 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPSlaveWriteBuffer(BUFFER, unsigned char value);
# 617 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/pmp.h" 3
void PMPSlaveWriteBuffers(unsigned char* source);
# 53 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 1 3
# 601 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
typedef enum {

        IOPORT_A,


        IOPORT_B,


        IOPORT_C,


        IOPORT_D,


        IOPORT_E,


        IOPORT_F,


        IOPORT_G,

 IOPORT_NUM
 }IoPortId;
# 648 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTSetPinsDigitalIn(IoPortId portId, unsigned int inputs);
# 672 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTSetPinsDigitalOut(IoPortId portId, unsigned int outputs);
# 696 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTSetPinsAnalogIn(IoPortId portId, unsigned int inputs);
# 720 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTSetPinsAnalogOut(IoPortId portId, unsigned int outputs);
# 744 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTResetPins(IoPortId portId, unsigned int pins);
# 762 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
unsigned int PORTRead(IoPortId portId);
# 782 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
unsigned int PORTReadBits(IoPortId portId, unsigned int bits);
# 800 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTWrite(IoPortId portId, unsigned int bits);
# 820 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTSetBits(IoPortId portId, unsigned int bits);
# 840 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTClearBits(IoPortId portId, unsigned int bits);
# 860 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/ports.h" 3
void PORTToggleBits(IoPortId portId, unsigned int bits);
# 54 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/power.h" 1 3
# 60 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/power.h" 3
void __attribute__((nomips16)) PowerSaveSleep(void);
# 78 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/power.h" 3
void __attribute__((nomips16)) PowerSaveIdle(void);
# 55 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/reset.h" 1 3
# 45 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/reset.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/lock.h" 1 3
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/reset.h" 2 3
# 140 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/reset.h" 3
void __attribute__((noreturn)) SoftReset(void);
# 163 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/reset.h" 3
char isWU(void);
# 56 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 1 3
# 56 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
typedef union
{
 struct
 {
  unsigned char rsvd;
  unsigned char sec;
  unsigned char min;
  unsigned char hour;
 };
 unsigned char b[4];
 unsigned short w[2];
 unsigned long l;
}rtccTime;


typedef union
{
 struct
 {
  unsigned char wday;
  unsigned char mday;
  unsigned char mon;
  unsigned char year;
 };
 unsigned char b[4];
 unsigned short w[2];
 unsigned long l;
}rtccDate;


typedef enum
{
 RTCC_RPT_HALF_SEC,
 RTCC_RPT_SEC,
 RTCC_RPT_TEN_SEC,
 RTCC_RPT_MIN,
 RTCC_RPT_TEN_MIN,
 RTCC_RPT_HOUR,
 RTCC_RPT_DAY,
 RTCC_RPT_WEEK,
 RTCC_RPT_MON,
 RTCC_RPT_YEAR
}rtccRepeat;


typedef enum
{
 RTCC_CLK_ON,
 RTCC_SOSC_NRDY,
 RTCC_CLK_NRDY,
 RTCC_WR_DSBL,
}rtccRes;
# 136 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
rtccRes RtccInit(void);
# 175 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
rtccRes RtccOpen(unsigned long tm, unsigned long dt, int drift);
# 196 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccShutdown(void);
# 231 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetTime(unsigned long tm);
# 252 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetTime(void)
{
 unsigned int t0, t1;
 do
 {
  t0=RTCTIME;
  t1=RTCTIME;
 }while(t0!=t1);
 return t0;
}
# 293 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetDate(unsigned long dt);
# 314 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetDate(void)
{
 unsigned int d0, d1;
 do
 {
  d0=RTCDATE;
  d1=RTCDATE;
 }while(d0!=d1);

 return d0;
}
# 363 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetTimeDate(unsigned long tm, unsigned long dt);
# 386 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccGetTimeDate(rtccTime* pTm, rtccDate* pDt)
{
 rtccTime t0;
 rtccDate d0;
 do
 {
  d0.l=RTCDATE;
  t0.l=RTCTIME;
  pTm->l=RTCTIME;
  pDt->l=RTCDATE;
 }while((d0.l!=pDt->l) || (t0.l!=pTm->l));
}
# 424 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetAlarmTime(unsigned long tm);
# 443 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetAlarmTime(void)
{
 return ALRMTIME;
}
# 474 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetAlarmDate(unsigned long dt);
# 493 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetAlarmDate(void)
{
 return ALRMDATE;
}
# 531 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetAlarmTimeDate(unsigned long tm, unsigned long dt);
# 552 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccGetAlarmTimeDate(rtccTime* pTm, rtccDate* pDt)
{
 pTm->l=ALRMTIME;
 pDt->l=ALRMDATE;
}
# 577 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
 void RtccAlarmEnable(void);
# 599 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
 void RtccAlarmDisable(void);
# 619 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlarmEnable(void)
{
 int isAlrm0, isAlrm1;
 do
 {
  isAlrm0=RTCALRMbits.ALRMEN;
  isAlrm1=RTCALRMbits.ALRMEN;
 }while(isAlrm0!=isAlrm1);

 return isAlrm0;
}
# 651 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccChimeEnable(void);
# 672 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccChimeDisable(void);
# 692 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetChimeEnable(void)
{
 int ch0, ch1;
 do
 {
  ch0=RTCALRMbits.CHIME;
  ch1=RTCALRMbits.CHIME;
 }while(ch0!=ch1);

 return ch0;

}
# 724 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetAlarmRpt(rtccRepeat rpt);
# 743 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ rtccRepeat __attribute__((always_inline)) RtccGetAlarmRpt(void)
{
 rtccRepeat r0, r1;

 do
 {
  r0=(rtccRepeat)(RTCALRM&0x00000F00);
  r1=(rtccRepeat)(RTCALRM&0x00000F00);
 }while(r0!=r1);

 return (rtccRepeat)(r0>>0x00000008);
}
# 781 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetAlarmRptCount(int rptCnt);
# 801 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlarmRptCount(void)
{
 int rpt0, rpt1;
 do
 {
  rpt0=RTCALRMbits.ARPT;
  rpt1=RTCALRMbits.ARPT;
 }while(rpt0!=rpt1);

 return rpt0;
}
# 834 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
int RtccWeekDay(int year, int month, int day);
# 860 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
rtccRes RtccEnable(void);
# 886 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
int RtccDisable(void);
# 905 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetEnable(void)
{
 return (RTCCON&(0x00008000|0x00000040));
}
# 928 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ rtccRes __attribute__((always_inline)) RtccGetClkStat(void)
{

 if( (!(OSCCONbits.SOSCEN)) || (!(OSCCONbits.SOSCRDY)) )
 {
  return RTCC_SOSC_NRDY;
 }
 else if(!(RTCCONbits.RTCCLKON))
 {
  return RTCC_CLK_NRDY;
 }

 return RTCC_CLK_ON;
}
# 974 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccSetCalibration(int drift);
# 995 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetCalibration(void)
{
 return RTCCONbits.CAL;
}
# 1022 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccWrEnable(int enable)
{
 if(enable)
 {
  do{int intStat, dmaSusp; intStat=INTDisableInterrupts(); dmaSusp=DmaSuspend(); SYSKEY = 0, SYSKEY = 0xAA996655, SYSKEY = 0x556699AA; (RTCCONSET=0x00000008); SYSKEY = 0x33333333; DmaResume(dmaSusp); INTRestoreInterrupts(intStat);}while(0);
 }
 else
 {
  RTCCONCLR=0x00000008;
 }
}
# 1052 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetWrEnable(void)
{
 return RTCCONbits.RTCWREN!=0;
}
# 1074 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetSync(void)
{
 return RTCCONbits.RTCSYNC!=0;
}
# 1097 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetHalfSecond(void)
{
 return RTCCONbits.HALFSEC!=0;
}
# 1119 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlrmSync(void)
{
 return RTCALRMbits.ALRMSYNC!=0;
}
# 1142 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccSelectPulseOutput(int secPulse)
{
 if(secPulse)
 {
  RTCCONSET=0x00000080;
 }
 else
 {
  RTCCONCLR=0x00000080;
 }
}
# 1177 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccAlarmPulseHigh(void);
# 1200 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccAlarmPulseLow(void);
# 1223 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
void RtccAlarmPulseToggle(void);
# 1243 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlarmPulse(void)
{
 return RTCALRMbits.PIV!=0;
}
# 1266 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccOutputEnable(int enable)
{
 if(enable)
 {
  RTCCONSET=0x00000001;
 }
 else
 {
  RTCCONCLR=0x00000001;
 }
}
# 1295 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetOutputEnable(void)
{
 return RTCCONbits.RTCOE!=0;
}
# 1319 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccFreezeEnable(int enable)
{
 if(enable)
 {
  RTCCONSET=0x00004000;
 }
 else
 {
  RTCCONCLR=0x00004000;
 }
}
# 1349 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetFreeze(void)
{
 return RTCCONbits.FRZ!=0;
}
# 1362 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/rtcc_legacy.h" 1 3
# 1363 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/rtcc.h" 2 3
# 57 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi.h" 1 3
# 44 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 1 3
# 73 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
typedef enum
{

 SPI_CHANNEL1 = 1,


 SPI_CHANNEL2 = 2,

        SPI_CHANNELS = 0

                        + 1


                        + 1

}SpiChannel;
# 109 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
typedef enum
{

 SPI_OPEN_MSTEN = 0x00000020,
 SPI_OPEN_SMP_END = 0x00000200,


 SPI_OPEN_SLVEN = 0,
 SPI_OPEN_SSEN = 0x00000080,


 SPI_OPEN_CKP_HIGH = 0x00000040,
 SPI_OPEN_CKE_REV = 0x00000100,


 SPI_OPEN_MODE8 = 0,
 SPI_OPEN_MODE16 = 0x00000400,
 SPI_OPEN_MODE32 = 0x00000800,


 SPI_OPEN_FRMEN = 0x80000000,
 SPI_OPEN_FSP_IN = 0x40000000,

 SPI_OPEN_FSP_HIGH = 0x20000000,
 SPI_OPEN_FSP_CLK1 = 0x00020000,



 SPI_OPEN_DISSDO = 0x00001000,
 SPI_OPEN_SIDL = 0x00002000,
 SPI_OPEN_FRZ = 0x00004000,
 SPI_OPEN_ON = 0x00008000,
}SpiOpenFlags;


typedef enum
{
 SPI_STAT_SPIRBF = 0x00000001,
 SPI_STAT_SPITBE = 0x00000008,
 SPI_STAT_SPIROV = 0x00000040,
 SPI_STAT_SPIBUSY = 0x00000800,
}SpiStatusFlags;
# 197 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnOpen(SpiChannel chn, SpiOpenFlags oFlags, unsigned int srcClkDiv);
# 220 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnClose(SpiChannel chn);
# 252 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnChangeMode(SpiChannel chn, int isMaster, int isFrmMaster, int waitBusy);
# 274 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
int SpiChnDataRdy(SpiChannel chn);
# 301 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
unsigned int SpiChnReadC(SpiChannel chn);
# 327 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
unsigned int SpiChnGetC(SpiChannel chn);
# 361 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnGetS(SpiChannel chn, unsigned int *pBuff, unsigned int nChars);
# 384 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
int SpiChnTxBuffEmpty(SpiChannel chn);
# 405 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnWriteC(SpiChannel chn, unsigned int data);
# 426 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnPutC(SpiChannel chn, unsigned int data);
# 450 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnPutS(SpiChannel chn, unsigned int* pBuff, unsigned int nChars);
# 472 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
int SpiChnGetRov(SpiChannel chn, int clear);
# 493 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
int SpiChnIsBusy(SpiChannel chn);
# 513 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
SpiStatusFlags SpiChnGetStatus(SpiChannel chn);
# 536 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
volatile void* SpiChnBuffer(SpiChannel chn);
# 546 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
typedef enum
{

 SPI_CONFIG_MSTEN = 0x00000020,
 SPI_CONFIG_SMP_END = 0x00000200,


 SPI_CONFIG_SLVEN = 0,
 SPI_CONFIG_SSEN = 0x00000080,


 SPI_CONFIG_CKP_HIGH = 0x00000040,
 SPI_CONFIG_CKE_REV = 0x00000100,


 SPI_CONFIG_MODE8 = 0,
 SPI_CONFIG_MODE16 = 0x00000400,
 SPI_CONFIG_MODE32 = 0x00000800,


 SPI_CONFIG_FRMEN = 0x80000000,
 SPI_CONFIG_FSP_IN = 0x40000000,

 SPI_CONFIG_FSP_HIGH = 0x20000000,
 SPI_CONFIG_FSP_CLK1 = 0x00020000,



 SPI_CONFIG_DISSDO = 0x00001000,
 SPI_CONFIG_SIDL = 0x00002000,
 SPI_CONFIG_FRZ = 0x00004000,
 SPI_CONFIG_ON = 0x00008000,
}SpiConfigFlags;
# 611 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnConfigure(SpiChannel chn, SpiConfigFlags config);
# 634 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnEnable(SpiChannel chn, int enable);
# 666 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
unsigned int SpiChnSetBitRate(SpiChannel chn, unsigned int srcClk, unsigned int spiClk);
# 687 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
void SpiChnSetBrg(SpiChannel chn, unsigned int brg);
# 706 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
extern __inline__ unsigned int __attribute__((always_inline)) SpiBrgVal(unsigned int srcClk, unsigned int spiClk)
{
 return (srcClk / (2 * spiClk)) - 1;
}
# 722 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 1 3
# 61 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
typedef enum
{

 SPI_CON_MSTEN = 0x00000020,
 SPI_CON_SMP = 0x00000200,


 SPI_CON_SLVEN = 0,
 SPI_CON_SSEN = 0x00000080,


 SPI_CON_CKP = 0x00000040,
 SPI_CON_CKE = 0x00000100,


 SPI_CON_MODE8 = 0,
 SPI_CON_MODE16 = 0x00000400,
 SPI_CON_MODE32 = 0x00000800,


 SPI_CON_FRMEN = 0x80000000,
 SPI_CON_FRMSYNC = 0x40000000,

 SPI_CON_FRMPOL = 0x20000000,
 SPI_CON_SPIFE = 0x00020000,



 SPI_CON_DISSDO = 0x00001000,
 SPI_CON_SIDL = 0x00002000,
 SPI_CON_FRZ = 0x00004000,
 SPI_CON_ON = 0x00008000,
}SpiCtrlFlags;
# 605 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
typedef union
{
 struct
 {
     unsigned PPRE: 2;
     unsigned SPRE: 3;
     unsigned MSTEN: 1;
     unsigned CKP: 1;
     unsigned SSEN: 1;
     unsigned CKE: 1;
     unsigned SMP: 1;
     unsigned MODE16: 1;
     unsigned MODE32: 1;
     unsigned DISSDO: 1;
     unsigned: 17;
     unsigned FRMSYNC: 1;
  unsigned FRMEN: 1;
 };
 unsigned int w;
}SpiOpenConfig1;
# 679 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
typedef union
{
 struct
 {
  unsigned: 6;
  unsigned SPIROV: 1;
  unsigned: 6;
  unsigned SIDL: 1;
  unsigned FRZ: 1;
  unsigned ON: 1;
  unsigned: 1;
  unsigned SPIFE: 1;
  unsigned: 11;
     unsigned FRMPOL: 1;
 };
 unsigned int w;
}SpiOpenConfig2;
# 725 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
typedef union
{
 struct
 {
  unsigned ipl: 3;
  unsigned ispl: 2;
  unsigned fie: 1;
  unsigned txie: 1;
  unsigned rxie: 1;
 };
 unsigned int w;
}SpiConfigInt;
# 833 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 void OpenSPI1(unsigned int config1, unsigned int config2);
# 1085 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 unsigned int getcSPI1(void);
# 1140 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 unsigned int getsSPI1(unsigned int length, unsigned int *rdptr, unsigned int spi_data_wait);
# 1164 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 void putsSPI1(unsigned int length, unsigned int *wrptr);
# 1227 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 void OpenSPI2(unsigned int config1, unsigned int config2 );
# 1472 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 unsigned int getcSPI2(void);
# 1525 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 unsigned int getsSPI2(unsigned int length, unsigned int *rdptr, unsigned int spi_data_wait);
# 1549 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/spi_legacy.h" 3
 void putsSPI2(unsigned int length, unsigned int *wrptr);
# 723 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi_3xx_4xx.h" 2 3
# 45 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/spi.h" 2 3
# 58 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 1 3
# 39 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/osc.h" 1 3
# 66 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/osc.h" 3
void OSCConfig(unsigned long int source, unsigned long int mult, unsigned long int post, unsigned long int div);
# 137 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/osc.h" 3
extern inline void __attribute__((always_inline)) OSCSetPBDIV(unsigned int oscPbDiv)
{
 unsigned int dma_status;
 unsigned int int_status;
 __OSCCONbits_t oscBits;

 do{int_status=INTDisableInterrupts(); dma_status=DmaSuspend(); SYSKEY = 0, SYSKEY = 0xAA996655, SYSKEY = 0x556699AA;}while(0);

 oscBits.w=OSCCON;
 oscBits.PBDIV=0;
 oscBits.w|=oscPbDiv;
 OSCCON=oscBits.w;
 oscBits.w=OSCCON;

 do{SYSKEY = 0x33333333; DmaResume(dma_status); INTRestoreInterrupts(int_status);}while(0);
}
# 40 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 2 3
# 76 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfigPB(unsigned int sys_clock)
{
    unsigned int pb_div;
    unsigned int pb_clock;

    pb_clock = sys_clock;

    if(sys_clock > 80000000)
    {
        pb_div=(1 << 0x00000013);
        pb_clock >>= 1;
    }
    else
    {
        pb_div=(0 << 0x00000013);
    }

    OSCSetPBDIV(pb_div);

    return pb_clock;
}
# 117 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 3
extern inline void __attribute__((always_inline)) SYSTEMConfigWaitStates(unsigned int sys_clock)
{

    unsigned int wait_states;
    unsigned int int_status;



    wait_states = 0;

    while(sys_clock > 30000000)
    {
        wait_states++;
        sys_clock -= 30000000;
    }

    int_status=INTDisableInterrupts();
    (CHECON = (wait_states));
    INTRestoreInterrupts(int_status);


}
# 158 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfigWaitStatesAndPB(unsigned int sys_clock)
{

    unsigned int wait_states;

    unsigned int pb_clock;
    unsigned int int_status;

    pb_clock = SYSTEMConfigPB(sys_clock);





    wait_states = 0;

    while(sys_clock > 30000000)
    {
        wait_states++;
        sys_clock -= 30000000;
    }

    int_status=INTDisableInterrupts();
    (CHECON = (wait_states));
    INTRestoreInterrupts(int_status);



    return pb_clock;
}
# 207 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfigPerformance(unsigned int sys_clock)
{

    unsigned int pb_clk;

    unsigned int cache_status;

    unsigned int int_status;

    pb_clk = SYSTEMConfigWaitStatesAndPB(sys_clock);

    int_status=INTDisableInterrupts();

    (BMXCONCLR = 0x00000040);


    cache_status = CHECON;
    cache_status |= (3 << 0x00000004);
    (CHECON = (cache_status));
    CheKseg0CacheOn();


    INTRestoreInterrupts(int_status);

    return pb_clk;

}
# 259 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfig(unsigned int sys_clock, unsigned int flags)
{
    unsigned int pb_clk;
    unsigned int int_status;

    unsigned int cache_status;


    int_status=INTDisableInterrupts();

    (BMXCONCLR = 0x00000040);

    if(flags & 0x00000001)
    {
        SYSTEMConfigWaitStates(sys_clock);
    }

    if(flags & 0x00000002)
    {
        SYSTEMConfigPB(sys_clock);
    }



    if(flags & 0x00000004)
    {
        cache_status = CHECON;
        cache_status |= (3 << 0x00000004);
        (CHECON = (cache_status));
        CheKseg0CacheOn();
    }


    pb_clk = sys_clock;
    pb_clk >>= OSCCONbits.PBDIV;

    INTRestoreInterrupts(int_status);

    return pb_clk;

}
# 59 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/timer.h" 1 3
# 60 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/timer.h" 3
void __attribute__((nomips16)) OpenCoreTimer(unsigned int period);
# 78 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/timer.h" 3
 void __attribute__((nomips16)) UpdateCoreTimer(unsigned int period);
# 190 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/timer.h" 3
unsigned int __attribute__((nomips16)) ReadCoreTimer(void);
# 207 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/timer.h" 3
void __attribute__((nomips16)) WriteCoreTimer(unsigned int timer);
# 60 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 1 3
# 54 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/uart_legacy.h" 1 3
# 505 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/uart_legacy.h" 3
void putsUART1(const char* buffer);



void putsUART2(const char* buffer);
# 662 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/legacy/uart_legacy.h" 3
unsigned int getsUART1(unsigned int length, char* buffer, unsigned int uart_data_wait);



unsigned int getsUART2(unsigned int length, char* buffer, unsigned int uart_data_wait);
# 55 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 2 3
# 73 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef struct
{
 volatile UINT reg;
 volatile UINT clr;
 volatile UINT set;
 volatile UINT inv;
}REG_SET;

typedef struct
{
 volatile REG_SET mode;
 volatile REG_SET sta;
 volatile REG_SET tx;
 volatile REG_SET rx;
 volatile REG_SET brg;
}UART_REGS;

extern UART_REGS * const uartReg[];
# 103 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef enum
{


    UART1 = 0,



    UART3A,
# 130 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
    UART_NUMBER_OF_MODULES

} UART_MODULE;
# 154 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef enum
{

    UART_DISABLE = 0x00 ,


    UART_ENABLE = 0x80 ,




    UART_PERIPHERAL = 0x01 ,


    UART_RX = 0x02 ,


    UART_TX = 0x04


} UART_ENABLE_MODE;
# 236 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef enum
{

    UART_ENABLE_HIGH_SPEED = 0x00000008 ,


    UART_INVERT_RECEIVE_POLARITY = 0x00000010 ,


    UART_ENABLE_LOOPBACK = 0x00000040 ,


    UART_ENABLE_WAKE_ON_START = 0x00000080 ,



    UART_ENABLE_PINS_BIT_CLOCK = 0x00000300 ,



    UART_ENABLE_PINS_CTS_RTS = 0x00000200 ,



    UART_ENABLE_PINS_RTS = 0x00000100 ,



    UART_ENABLE_PINS_TX_RX_ONLY = 0x00000000 ,




    UART_RTS_WHEN_RX_NOT_FULL = 0x00000000 ,




    UART_RTS_WHEN_TX_NOT_EMPTY = 0x00000800 ,


    UART_ENABLE_IRDA = 0x00001000 ,



    UART_ENABLE_STOP_ON_IDLE = 0x00002000 ,


    UART_INVERT_TRANSMIT_POLARITY = 0x20000000 ,





    UART_SUPPORT_IEEE_485 = 0x00000900

} UART_CONFIGURATION;
# 315 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef enum
{

    UART_INTERRUPT_ON_TX_BUFFER_EMPTY = 0x8000 ,


    UART_INTERRUPT_ON_TX_DONE = 0x4000 ,



    UART_INTERRUPT_ON_TX_NOT_FULL = 0x0000 ,



    UART_INTERRUPT_ON_RX_FULL = 0x00C0 ,



    UART_INTERRUPT_ON_RX_3_QUARTER_FULL = 0x0080 ,



    UART_INTERRUPT_ON_RX_HALF_FULL = 0x0040 ,



    UART_INTERRUPT_ON_RX_NOT_EMPTY = 0x0000

} UART_FIFO_MODE;
# 365 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef enum
{

    UART_DATA_SIZE_8_BITS = 0x0000 ,


    UART_DATA_SIZE_9_BITS = 0x0006 ,


    UART_PARITY_ODD = 0x0004 ,


    UART_PARITY_EVEN = 0x0002 ,


    UART_PARITY_NONE = 0x0000 ,


    UART_STOP_BITS_2 = 0x0001 ,


    UART_STOP_BITS_1 = 0x0000

} UART_LINE_CONTROL_MODE;
# 406 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef enum
{

    UART_TRANSMITTER_NOT_FULL = 0x00000200 ,


    UART_TRANSMITTER_EMPTY = 0x00000100 ,


    UART_RECEIVER_IDLE = 0x00000010 ,


    UART_PARITY_ERROR = 0x00000008 ,




    UART_FRAMING_ERROR = 0x00000004 ,


    UART_OVERRUN_ERROR = 0x00000002 ,


    UART_DATA_READY = 0x00000001

} UART_LINE_STATUS;
# 449 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
typedef union
{

    struct
    {
        UINT16 data8bit : 8;
    };


    struct
    {
        UINT16 data9bit : 9;
    };

    UINT16 __data;
} UART_DATA;
# 506 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
void UARTEnable( UART_MODULE id, UART_ENABLE_MODE mode );
# 546 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
void UARTConfigure ( UART_MODULE id, UART_CONFIGURATION flags );
# 587 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
void UARTSetFifoMode ( UART_MODULE id, UART_FIFO_MODE mode );
# 631 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
UINT32 UARTSetDataRate ( UART_MODULE id, UINT32 sourceClock, UINT32 dataRate );
# 671 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
UINT32 UARTGetDataRate( UART_MODULE id, UINT32 sourceClock );
# 708 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
void UARTSetLineControl ( UART_MODULE id, UART_LINE_CONTROL_MODE mode );
# 751 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline UART_LINE_STATUS __attribute__((always_inline)) UARTGetLineStatus ( UART_MODULE id )
{
    return (UART_LINE_STATUS)(uartReg[id]->sta.reg & ((UART_TRANSMITTER_NOT_FULL | UART_TRANSMITTER_EMPTY | UART_RECEIVER_IDLE | UART_PARITY_ERROR | UART_FRAMING_ERROR | UART_OVERRUN_ERROR | UART_DATA_READY)));
}
# 790 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline BOOL __attribute__ ((always_inline)) UARTTransmitterIsReady ( UART_MODULE id )
{
    return (BOOL)(!(uartReg[id]->sta.reg & 0x00000200));
}
# 833 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline void __attribute__((always_inline)) UARTSendDataByte ( UART_MODULE id, BYTE data )
{
    uartReg[id]->tx.reg = data;
}
# 876 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline void __attribute__((always_inline)) UARTSendData( UART_MODULE id, UART_DATA data )
{
    uartReg[id]->tx.reg = data.__data;
}
# 916 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline BOOL __attribute__((always_inline)) UARTTransmissionHasCompleted ( UART_MODULE id )
{
    return (BOOL)(0x00000100 == (uartReg[id]->sta.reg & 0x00000100));
}
# 958 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline BOOL __attribute__((always_inline)) UARTReceivedDataIsAvailable ( UART_MODULE id )
{
    return (BOOL)(0x00000001 == (uartReg[id]->sta.reg & 0x00000001));
}
# 997 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline BYTE __attribute__((always_inline)) UARTGetDataByte ( UART_MODULE id )
{
    return (BYTE)uartReg[id]->rx.reg;
}
# 1036 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline UART_DATA __attribute__((always_inline)) UARTGetData ( UART_MODULE id )
{
    UART_DATA data;

    data.__data = uartReg[id]->rx.reg;

    return data;
}
# 1083 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
void UARTSetAddress ( UART_MODULE id, BYTE address, BOOL watch );
# 1128 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
void UARTWatchForAddress ( UART_MODULE id, BOOL watch );
# 1165 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline void __attribute__((always_inline)) UARTSendBreak ( UART_MODULE id )
{
    uartReg[id]->sta.set = 0x00000800;
}
# 1209 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline void __attribute__((always_inline)) UARTStartAutoDataRateDetect ( UART_MODULE id )
{
   uartReg[id]->mode.set = 0x00000020;
}
# 1250 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/uart.h" 3
extern inline BOOL __attribute__((always_inline)) UARTDataRateDetected ( UART_MODULE id )
{
    return (BOOL)(!(uartReg[id]->mode.reg & 0x00000020));
}
# 61 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/wdt.h" 1 3
# 62 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/eth.h" 1 3
# 49 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/eth.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdlib.h" 1 3
# 77 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdlib.h" 3
typedef struct {int quot; int rem;} div_t;
typedef struct {long int quot; long int rem;} ldiv_t;

typedef struct {long long int quot; long long int rem;} lldiv_t;


double atof (const char *);
int atoi (const char *);
long atol (const char *);
double strtod (const char *, char **);
long strtol (const char *, char **, int);
unsigned long strtoul (const char *, char **, int);

float strtof (const char *, char **);
long long atoll (const char *);
long long strtoll (const char *, char **, int);
unsigned long long strtoull (const char *, char **, int);



int rand (void);
int rand_r (unsigned int *);
void srand (unsigned int);


void free (void *);
void *malloc (size_t);
void *realloc (void *, size_t);
void *calloc (size_t, size_t);


void abort (void) __attribute__ ((noreturn));
void exit (int) __attribute__ ((noreturn));
int atexit (void (*)(void));
int system (const char *);


char *getenv (const char *);


void *bsearch (const void *, const void *,
    size_t, size_t,
    int (*)(const void *, const void *));

void qsort (void *base,
   size_t, size_t ,
   int (*)(const void *, const void *));


int abs (int);
div_t div (int, int);

long int labs (long int);
ldiv_t ldiv (long int, long int);


long long int llabs (long long int);
lldiv_t lldiv (long long int, long long int);
# 144 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdlib.h" 3
int mblen (const char *, size_t);
int mbtowc (wchar_t *, const char *, size_t);
size_t mbstowcs (wchar_t *, const char *, size_t);
int wctomb (char *, wchar_t);
size_t wcstombs (char *, const wchar_t *, size_t);
# 50 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/eth.h" 2 3
# 63 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 1 3
# 76 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
# 86 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
    CAN_NUMBER_OF_MODULES

}CAN_MODULE;
# 103 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_CHANNEL0,
 CAN_CHANNEL1,
 CAN_CHANNEL2,
 CAN_CHANNEL3,
 CAN_CHANNEL4,
 CAN_CHANNEL5,
 CAN_CHANNEL6,
 CAN_CHANNEL7,
 CAN_CHANNEL8,
 CAN_CHANNEL9,
 CAN_CHANNEL10,
 CAN_CHANNEL11,
 CAN_CHANNEL12,
 CAN_CHANNEL13,
 CAN_CHANNEL14,
 CAN_CHANNEL15,
 CAN_CHANNEL16,
 CAN_CHANNEL17,
 CAN_CHANNEL18,
 CAN_CHANNEL19,
 CAN_CHANNEL20,
 CAN_CHANNEL21,
 CAN_CHANNEL22,
 CAN_CHANNEL23,
 CAN_CHANNEL24,
 CAN_CHANNEL25,
 CAN_CHANNEL26,
 CAN_CHANNEL27,
 CAN_CHANNEL28,
 CAN_CHANNEL29,
 CAN_CHANNEL30,
 CAN_CHANNEL31,
 CAN_ALL_CHANNELS


}CAN_CHANNEL;
# 155 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{


 CAN_NORMAL_OPERATION,



 CAN_DISABLE,




 CAN_LOOPBACK,




 CAN_LISTEN_ONLY,



 CAN_CONFIGURATION,



 CAN_LISTEN_ALL_MESSAGES = 7

}CAN_OP_MODE;
# 205 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_RX_CHANNEL_NOT_EMPTY = 0x1,
 CAN_RX_CHANNEL_HALF_FULL = 0x2,
 CAN_RX_CHANNEL_FULL = 0x4,
 CAN_RX_CHANNEL_OVERFLOW = 0x8,
 CAN_RX_CHANNEL_ANY_EVENT = 0xF,
 CAN_TX_CHANNEL_EMPTY = 0x100,
 CAN_TX_CHANNEL_HALF_EMPTY = 0x200,
 CAN_TX_CHANNEL_NOT_FULL = 0x400,
 CAN_TX_CHANNEL_ANY_EVENT = 0x700

}CAN_CHANNEL_EVENT;
# 230 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_BIT_1TQ,
 CAN_BIT_2TQ,
 CAN_BIT_3TQ,
 CAN_BIT_4TQ,
 CAN_BIT_5TQ,
 CAN_BIT_6TQ,
 CAN_BIT_7TQ,
 CAN_BIT_8TQ

}CAN_BIT_TQ;
# 258 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef struct
{


 CAN_BIT_TQ phaseSeg2Tq;



 CAN_BIT_TQ phaseSeg1Tq;



 CAN_BIT_TQ propagationSegTq;





 BOOL phaseSeg2TimeSelect;





 BOOL sample3Time;



 CAN_BIT_TQ syncJumpWidth;

}CAN_BIT_CONFIG;
# 301 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_CHANNEL0_EVENT,
 CAN_CHANNEL1_EVENT,
 CAN_CHANNEL2_EVENT,
 CAN_CHANNEL3_EVENT,
 CAN_CHANNEL4_EVENT,
 CAN_CHANNEL5_EVENT,
 CAN_CHANNEL6_EVENT,
 CAN_CHANNEL7_EVENT,
 CAN_CHANNEL8_EVENT,
 CAN_CHANNEL9_EVENT,
 CAN_CHANNEL10_EVENT,
 CAN_CHANNEL11_EVENT,
 CAN_CHANNEL12_EVENT,
 CAN_CHANNEL13_EVENT,
 CAN_CHANNEL14_EVENT,
 CAN_CHANNEL15_EVENT,
 CAN_CHANNEL16_EVENT,
 CAN_CHANNEL17_EVENT,
 CAN_CHANNEL18_EVENT,
 CAN_CHANNEL19_EVENT,
 CAN_CHANNEL20_EVENT,
 CAN_CHANNEL21_EVENT,
 CAN_CHANNEL22_EVENT,
 CAN_CHANNEL23_EVENT,
 CAN_CHANNEL24_EVENT,
 CAN_CHANNEL25_EVENT,
 CAN_CHANNEL26_EVENT,
 CAN_CHANNEL27_EVENT,
 CAN_CHANNEL28_EVENT,
 CAN_CHANNEL29_EVENT,
 CAN_CHANNEL30_EVENT,
 CAN_CHANNEL31_EVENT,
 CAN_NO_EVENT = 0x40,
 CAN_ERROR_EVENT,
 CAN_WAKEUP_EVENT,
 CAN_RX_CHANNEL_OVERFLOW_EVENT,
 CAN_ADDRESS_ERROR_EVENT,
 CAN_BUS_BANDWIDTH_ERROR,
 CAN_TIMESTAMP_TIMER_EVENT,
 CAN_MODE_CHANGE_EVENT,
 CAN_INVALID_MESSAGE_RECEIVED_EVENT

}CAN_EVENT_CODE;
# 357 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_FILTER0,
 CAN_FILTER1,
 CAN_FILTER2,
 CAN_FILTER3,
 CAN_FILTER4,
 CAN_FILTER5,
 CAN_FILTER6,
 CAN_FILTER7,
 CAN_FILTER8,
 CAN_FILTER9,
 CAN_FILTER10,
 CAN_FILTER11,
 CAN_FILTER12,
 CAN_FILTER13,
 CAN_FILTER14,
 CAN_FILTER15,
 CAN_FILTER16,
 CAN_FILTER17,
 CAN_FILTER18,
 CAN_FILTER19,
 CAN_FILTER20,
 CAN_FILTER21,
 CAN_FILTER22,
 CAN_FILTER23,
 CAN_FILTER24,
 CAN_FILTER25,
 CAN_FILTER26,
 CAN_FILTER27,
 CAN_FILTER28,
 CAN_FILTER29,
 CAN_FILTER30,
 CAN_FILTER31,




    CAN_NUMBER_OF_FILTERS


}CAN_FILTER;
# 410 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_FILTER_MASK0,
 CAN_FILTER_MASK1,
 CAN_FILTER_MASK2,
 CAN_FILTER_MASK3,




    CAN_NUMBER_OF_FILTER_MASKS

}CAN_FILTER_MASK;
# 436 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_EID,
 CAN_SID

}CAN_ID_TYPE;
# 458 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_TX_RTR_ENABLED,
 CAN_TX_RTR_DISABLED

}CAN_TX_RTR;
# 479 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_RX_DATA_ONLY,
 CAN_RX_FULL_RECEIVE

}CAN_RX_DATA_MODE;
# 502 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_FILTER_MASK_IDE_TYPE,
 CAN_FILTER_MASK_ANY_TYPE

}CAN_FILTER_MASK_TYPE;
# 523 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_LOWEST_PRIORITY,
 CAN_LOW_MEDIUM_PRIORITY,
 CAN_HIGH_MEDIUM_PRIORITY,
 CAN_HIGHEST_PRIORITY

}CAN_TXCHANNEL_PRIORITY;
# 544 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_DNET_FILTER_DISABLE,
 CAN_DNET_FILTER_SIZE_1_BIT,
    CAN_DNET_FILTER_SIZE_2_BIT,
    CAN_DNET_FILTER_SIZE_3_BIT,
 CAN_DNET_FILTER_SIZE_4_BIT,
 CAN_DNET_FILTER_SIZE_5_BIT,
 CAN_DNET_FILTER_SIZE_6_BIT,
 CAN_DNET_FILTER_SIZE_7_BIT,
 CAN_DNET_FILTER_SIZE_8_BIT,
 CAN_DNET_FILTER_SIZE_9_BIT,
 CAN_DNET_FILTER_SIZE_10_BIT,
 CAN_DNET_FILTER_SIZE_11_BIT,
 CAN_DNET_FILTER_SIZE_12_BIT,
 CAN_DNET_FILTER_SIZE_13_BIT,
 CAN_DNET_FILTER_SIZE_14_BIT,
 CAN_DNET_FILTER_SIZE_15_BIT,
 CAN_DNET_FILTER_SIZE_16_BIT,
 CAN_DNET_FILTER_SIZE_17_BIT,
 CAN_DNET_FILTER_SIZE_18_BIT,

}CAN_DNET_FILTER_SIZE;
# 584 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{


 CAN_TX_EVENT = 0x1,



 CAN_RX_EVENT = 0x2,




 CAN_TIMESTAMP_TIMER_OVERFLOW_EVENT = 0x4,




 CAN_OPERATION_MODE_CHANGE_EVENT = 0x8,



    CAN_RX_OVERFLOW_EVENT = 0x800,




 CAN_SYSTEM_ERROR_EVENT = 0x1000,



 CAN_BUS_ERROR_EVENT = 0x2000,




 CAN_BUS_ACTIVITY_WAKEUP_EVENT = 0x4000,



 CAN_INVALID_RX_MESSAGE_EVENT = 0x8000

}CAN_MODULE_EVENT;
# 643 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{

 CAN_TX_RX_WARNING_STATE = 0x10000,


 CAN_RX_WARNING_STATE = 0x20000,


 CAN_TX_WARNING_STATE = 0x40000,


 CAN_RX_BUS_PASSIVE_STATE = 0x80000,


    CAN_TX_BUS_PASSIVE_STATE = 0x100000,


 CAN_TX_BUS_OFF_STATE = 0x200000

}CAN_ERROR_STATE;
# 680 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{


 CAN_STOP_IN_IDLE = 0x2000,



 CAN_RX_TIMESTAMP = 0x100000,



 CAN_WAKEUP_BUS_FILTER = 0x400000

}CAN_MODULE_FEATURES;
# 710 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{
 CAN_CHANNEL0_MASK = 0x00000001,
 CAN_CHANNEL1_MASK = 0x00000002,
 CAN_CHANNEL2_MASK = 0x00000004,
 CAN_CHANNEL3_MASK = 0x00000008,
 CAN_CHANNEL4_MASK = 0x00000010,
 CAN_CHANNEL5_MASK = 0x00000020,
 CAN_CHANNEL6_MASK = 0x00000040,
 CAN_CHANNEL7_MASK = 0x00000080,
 CAN_CHANNEL8_MASK = 0x00000100,
 CAN_CHANNEL9_MASK = 0x00000200,
 CAN_CHANNEL10_MASK = 0x00000400,
 CAN_CHANNEL11_MASK = 0x00000800,
 CAN_CHANNEL12_MASK = 0x00001000,
 CAN_CHANNEL13_MASK = 0x00002000,
 CAN_CHANNEL14_MASK = 0x00004000,
 CAN_CHANNEL15_MASK = 0x00008000,
 CAN_CHANNEL16_MASK = 0x00010000,
 CAN_CHANNEL17_MASK = 0x00020000,
 CAN_CHANNEL18_MASK = 0x00040000,
 CAN_CHANNEL19_MASK = 0x00080000,
 CAN_CHANNEL20_MASK = 0x00100000,
 CAN_CHANNEL21_MASK = 0x00200000,
 CAN_CHANNEL22_MASK = 0x00400000,
 CAN_CHANNEL23_MASK = 0x00800000,
 CAN_CHANNEL24_MASK = 0x01000000,
 CAN_CHANNEL25_MASK = 0x02000000,
 CAN_CHANNEL26_MASK = 0x04000000,
 CAN_CHANNEL27_MASK = 0x08000000,
 CAN_CHANNEL28_MASK = 0x10000000,
 CAN_CHANNEL29_MASK = 0x20000000,
 CAN_CHANNEL30_MASK = 0x40000000,
 CAN_CHANNEL31_MASK = 0x80000000,
 CAN_ANYCHANNEL_MASK = 0xFFFFFFFF

}CAN_CHANNEL_MASK;
# 761 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef enum
{

 CAN_TX_CHANNEL_TRANSMITTING = 0x8,


 CAN_TX_CHANNEL_ERROR = 0x10,


 CAN_TX_CHANNEL_ARBITRATION_LOST = 0x20

}CAN_TX_CHANNEL_CONDITION;
# 785 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef struct
{


 unsigned SID:11;
 unsigned :21;
}CAN_TX_MSG_SID;
# 805 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef struct
{



 unsigned DLC:4;


 unsigned RB0:1;
 unsigned :3;


 unsigned RB1:1;



 unsigned RTR:1;



 unsigned EID:18;



 unsigned IDE:1;




 unsigned SRR:1;
 unsigned :2;

}CAN_MSG_EID;
# 857 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef union {

 struct
 {

  CAN_TX_MSG_SID msgSID;


  CAN_MSG_EID msgEID;


  BYTE data[8];
 };



 UINT32 messageWord[4];

}CANTxMessageBuffer;
# 888 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef struct
{

 unsigned SID:11;


 unsigned FILHIT:5;



 unsigned CMSGTS:16;

}CAN_RX_MSG_SID;
# 920 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
typedef union {

 struct
 {

  CAN_RX_MSG_SID msgSID;


  CAN_MSG_EID msgEID;



  BYTE data[8];
 };



    BYTE dataOnlyMsgData[8];



 UINT32 messageWord[4];

}CANRxMessageBuffer;
# 991 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANAssignMemoryBuffer(CAN_MODULE module, void * buffer, UINT sizeInBytes);
# 1029 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANSetOperatingMode(CAN_MODULE module, CAN_OP_MODE opmode);
# 1064 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_OP_MODE CANGetOperatingMode(CAN_MODULE module);
# 1111 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANEnableFeature (CAN_MODULE module, CAN_MODULE_FEATURES features, BOOL enable);
# 1154 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANDeviceNetFilter(CAN_MODULE module, CAN_DNET_FILTER_SIZE dncnt);
# 1195 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANSetTimeStampValue(CAN_MODULE module, UINT value);
# 1230 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANGetTimeStampValue(CAN_MODULE module);
# 1271 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANSetTimeStampPrescalar(CAN_MODULE module, UINT prescalar);
# 1313 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANEnableModule(CAN_MODULE module, BOOL enable );
# 1375 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANSetSpeed (CAN_MODULE module, const CAN_BIT_CONFIG * canBitConfig,
                        UINT32 sysClock, UINT32 canBusSpeed );
# 1422 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
BOOL CANIsActive (CAN_MODULE module);
# 1467 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANResetChannel(CAN_MODULE module, CAN_CHANNEL channel );
# 1509 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
BOOL CANIsChannelReset (CAN_MODULE module, CAN_CHANNEL channel );
# 1592 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANUpdateChannel(CAN_MODULE module, CAN_CHANNEL channel);
# 1645 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANEnableModuleEvent(CAN_MODULE module, CAN_MODULE_EVENT flags, BOOL enable);
# 1685 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANClearModuleEvent (CAN_MODULE module, CAN_MODULE_EVENT flags);
# 1741 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANEnableChannelEvent(CAN_MODULE module, CAN_CHANNEL channel,CAN_CHANNEL_EVENT flags, BOOL enable);
# 1795 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_MODULE_EVENT CANGetModuleEvent (CAN_MODULE module);
# 1852 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_EVENT_CODE CANGetPendingEventCode (CAN_MODULE module);
# 1912 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_CHANNEL_MASK CANGetAllChannelEventStatus (CAN_MODULE module);
# 1973 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_CHANNEL_MASK CANGetAllChannelOverflowStatus (CAN_MODULE module);
# 2046 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_CHANNEL_EVENT CANGetChannelEvent (CAN_MODULE module, CAN_CHANNEL channel);
# 2087 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANClearChannelEvent(CAN_MODULE module, CAN_CHANNEL channel, CAN_CHANNEL_EVENT events);
# 2150 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANConfigureChannelForTx(CAN_MODULE module,CAN_CHANNEL channel, UINT channelSize,
                             CAN_TX_RTR rtren, CAN_TXCHANNEL_PRIORITY priority);
# 2199 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANAbortPendingTx(CAN_MODULE module, CAN_CHANNEL channel );
# 2239 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANFlushTxChannel(CAN_MODULE module, CAN_CHANNEL channel);
# 2299 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_TX_CHANNEL_CONDITION CANGetTxChannelCondition(CAN_MODULE module, CAN_CHANNEL channel);
# 2363 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CANTxMessageBuffer * CANGetTxMessageBuffer(CAN_MODULE module, CAN_CHANNEL channel);
# 2420 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
BOOL CANIsTxAborted(CAN_MODULE module, CAN_CHANNEL channel);
# 2514 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CANRxMessageBuffer * CANGetRxMessage(CAN_MODULE module, CAN_CHANNEL channel);
# 2576 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANConfigureChannelForRx(CAN_MODULE module, CAN_CHANNEL channel, UINT32 channelSize,
        CAN_RX_DATA_MODE dataOnly);
# 2657 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANConfigureFilterMask(CAN_MODULE module, CAN_FILTER_MASK mask, UINT32 maskbits,
                                CAN_ID_TYPE idType, CAN_FILTER_MASK_TYPE mide);
# 2714 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANConfigureFilter(CAN_MODULE module, CAN_FILTER filter, UINT32 id, CAN_ID_TYPE filterType);
# 2765 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANEnableFilter(CAN_MODULE module, CAN_FILTER filter, BOOL enable);
# 2810 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_FILTER CANGetLatestFilterHit(CAN_MODULE module);
# 2873 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
void CANLinkFilterToChannel(CAN_MODULE module, CAN_FILTER filter, CAN_FILTER_MASK mask, CAN_CHANNEL channel);
# 2916 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
BOOL CANIsFilterDisabled(CAN_MODULE module, CAN_FILTER filter);
# 2969 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANGetRxErrorCount(CAN_MODULE module);
# 3015 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANGetTxErrorCount(CAN_MODULE module);
# 3072 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
CAN_ERROR_STATE CANGetErrorState(CAN_MODULE module);
# 3103 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANTotalModules(void);
# 3128 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANTotalChannels(void);
# 3153 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANTotalFilters(void);
# 3178 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/peripheral/CAN.h" 3
UINT CANTotalMasks(void);
# 64 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/plib.h" 2 3
# 33 "wiring.c" 2


# 1 "wiring_private.h" 1
# 39 "wiring_private.h"
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 1 3
# 66 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/posix.h" 1 3
# 111 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/posix.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread/unistd.h" 1 3
# 112 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/posix.h" 2 3
# 67 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 2 3



# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdarg.h" 1 3
# 71 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdarg.h" 3
typedef __builtin_va_list __va_list;





typedef __builtin_va_list __gnuc_va_list;
# 71 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 2 3





# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 1 3
# 67 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/types.h" 1 3
# 64 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/types.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_types.h" 1 3
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_types.h" 3
typedef __signed char __int8_t;
typedef unsigned char __uint8_t;
typedef short int __int16_t;
typedef unsigned short int __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
# 60 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_types.h" 3
__extension__
typedef long long int __int64_t;

__extension__
typedef unsigned long long int __uint64_t;
# 75 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_types.h" 3
typedef int __intptr_t;
typedef unsigned int __uintptr_t;
# 65 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/types.h" 2 3



typedef __int8_t int8_t;



typedef __int8_t uint8_t;



typedef __int8_t u_int8_t;



typedef __int16_t int16_t;



typedef __int16_t uint16_t;



typedef __int16_t u_int16_t;



typedef __int32_t int32_t;



typedef __int32_t uint32_t;



typedef __int32_t u_int32_t;




typedef __int64_t int64_t;



typedef __int64_t uint64_t;



typedef __int64_t u_int64_t;
# 122 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/types.h" 3
typedef __int32_t register_t;
# 68 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/endian.h" 1 3
# 135 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/endian.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/endian.h" 1 3
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/endian.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/cdefs.h" 1 3
# 53 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/cdefs.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/cdefs.h" 1 3
# 54 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/cdefs.h" 2 3
# 47 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/endian.h" 2 3


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 1 3
# 50 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/endian.h" 2 3






# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/swap.h" 1 3
# 57 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/endian.h" 2 3
# 100 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/endian.h" 3

__uint32_t htobe32 (__uint32_t);
__uint16_t htobe16 (__uint16_t);
__uint32_t betoh32 (__uint32_t);
__uint16_t betoh16 (__uint16_t);

__uint32_t htole32 (__uint32_t);
__uint16_t htole16 (__uint16_t);
__uint32_t letoh32 (__uint32_t);
__uint16_t letoh16 (__uint16_t);

__uint32_t (ntohl) (__uint32_t);
__uint32_t (htonl) (__uint32_t);
__uint16_t (ntohs) (__uint16_t);
__uint16_t (htons) (__uint16_t);

# 135 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/endian.h" 2 3
# 69 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 2 3



typedef long time_t;
# 82 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 3
typedef long ssize_t;




typedef __int64_t off_t;




typedef int clockid_t;




typedef void * timer_t;




typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;
typedef unsigned long u_long;

typedef unsigned char unchar;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef __uint64_t u_quad_t;
typedef __int64_t quad_t;
typedef quad_t * qaddr_t;

typedef char * caddr_t;
typedef __int32_t daddr_t;
typedef __uint16_t dev_t;
typedef __uint32_t fixpt_t;
typedef __uint16_t gid_t;
typedef __uint16_t ino_t;
typedef long key_t;
typedef __uint16_t mode_t;
typedef __uint16_t nlink_t;
typedef __int16_t pid_t;
typedef __uint16_t uid_t;
typedef quad_t rlim_t;
typedef __uint32_t useconds_t;
typedef __int32_t suseconds_t;
# 140 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 3
typedef __uint32_t in_addr_t;
typedef __uint16_t in_port_t;
typedef __uint8_t sa_family_t;
typedef __uint32_t socklen_t;
# 164 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/types.h" 3
typedef __int32_t fd_mask;






typedef struct fd_set {
 fd_mask fds_bits[(((64) + (((sizeof(fd_mask) * 8)) - 1)) / ((sizeof(fd_mask) * 8)))];
} fd_set;
# 77 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 2 3
# 98 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/libc_thread.h" 1 3
# 61 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/libc_thread.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 1 3
# 62 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/signal.h" 1 3
# 61 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/signal.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/signal.h" 1 3
# 137 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/signal.h" 3
__extension__ typedef unsigned long long sigset_t;


typedef int sig_atomic_t;
# 182 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/signal.h" 3
struct siginfo;

struct sigaction {
  union {
    void (*usa_handler)(int);
    void (*usa_sigaction)(int,struct siginfo *,void *);
  } sa_u;


  sigset_t sa_mask;
  int sa_flags;
};






struct sigvec {
        void (*sv_handler) (int);
     int sv_mask;
        int sv_flags;
};
# 227 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/signal.h" 3
void (*signal (int,void (*)(int))) (int);
int raise (int);


int kill (pid_t, int);
int sigaction (int, const struct sigaction *, struct sigaction *);
int sigpending (sigset_t *);
int sigprocmask (int, const sigset_t *, sigset_t *);
int sigsuspend (const sigset_t *);
# 62 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/signal.h" 2 3
# 72 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/signal.h" 3
extern const char *const sys_signame[65];
extern const char *const sys_siglist[65];
# 63 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/time.h" 1 3
# 66 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/time.h" 3
struct timeval {
 long tv_sec;
 long tv_usec;
};


struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};
# 113 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/time.h" 3
struct xcptcontext;

struct itimerval {
    struct timeval it_interval;
    struct timeval it_value;
    void (*it_func)(struct timeval *, struct xcptcontext *);
};

int setitimer (unsigned int, struct itimerval *, struct itimerval *);
int getitimer (unsigned int, struct itimerval *);
int gettimeofday (struct timeval *, void *);
int settimeofday (const struct timeval *, void *);



struct timespec {
    long tv_sec;
    long tv_nsec;
};

struct itimerspec {
    struct timespec it_value;
    struct timespec it_interval;
};
# 174 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/time.h" 3
int clock_getres (clockid_t, struct timespec *);
int clock_gettime (clockid_t, struct timespec *);
int clock_settime (clockid_t, const struct timespec *);
int nanosleep (const struct timespec *, struct timespec *);

struct sigevent;
# 188 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sys/time.h" 3
int timer_create (clockid_t, struct sigevent *, timer_t *);
int timer_delete (timer_t);
int timer_getoverrun (timer_t);
int timer_gettime (timer_t, struct itimerspec *);
int timer_settime (timer_t, int, const struct itimerspec *,
         struct itimerspec *);
# 64 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 2 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sched.h" 1 3
# 69 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/sched.h" 3
struct sched_param {
    int sched_priority;
};

struct timespec;
int sched_get_priority_min (int);
int sched_get_priority_max (int);
int sched_rr_get_interval (pid_t, struct timespec *);
int sched_rr_set_interval (pid_t, const struct timespec *);
int sched_getscheduler (pid_t, struct sched_param *);
int sched_setscheduler (pid_t, const struct sched_param *);
int sched_getparam (pid_t, struct sched_param *);
int sched_setparam (pid_t, const struct sched_param *);
int sched_yield (void);
# 65 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 2 3


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread/impl.h" 1 3
# 71 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread/impl.h" 3
struct _rtpx_thread;
typedef struct _rtpx_thread * pthread_t;


typedef struct _rtpx_waitq {
    struct _rtpx_thread * wq_first;
} _pthread_waitq_t;
# 68 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 2 3

# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread/limits.h" 1 3
# 70 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 2 3
# 102 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
enum {
    PTHREAD_CREATE_JOINABLE,

    PTHREAD_CREATE_DETACHED,

    PTHREAD_CREATE_DAEMON_NP

};


enum {
    PTHREAD_SCOPE_PROCESS,

    PTHREAD_SCOPE_SYSTEM

};


enum {
    PTHREAD_INHERIT_SCHED,

    PTHREAD_EXPLICIT_SCHED

};


typedef struct {
    void * tha_stackaddr;
    unsigned int tha_stacksize;
    unsigned int tha_guardsize;
    unsigned char tha_detachstate;
    unsigned char tha_scope;
    unsigned char tha_inheritsched;
    unsigned char tha_schedpolicy;
    struct sched_param tha_schedparam;
    const char * tha_name;
} pthread_attr_t;



enum {
    PTHREAD_PRIO_NONE,

    PTHREAD_PRIO_INHERIT,

    PTHREAD_PRIO_PROTECT

};


enum {
    PTHREAD_PROCESS_PRIVATE,

    PTHREAD_PROCESS_SHARED

};



enum
{
  PTHREAD_MUTEX_DEFAULT_NP,
  PTHREAD_MUTEX_FAST_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP







};


typedef struct {
    unsigned char mxa_type;
    unsigned char mxa_pshared;
    unsigned char mxa_protocol;
    unsigned char mxa_prioceiling;
    const char * mxa_name;
} pthread_mutexattr_t;


typedef struct {
    unsigned char cda_pshared;
    unsigned char cda_interruptible;
    const char * cda_name;
} pthread_condattr_t;


typedef struct {
    unsigned char rwa_pshared;
    const char * rwa_name;
} pthread_rwlockattr_t;





int pthread_attr_init (pthread_attr_t *);
int pthread_attr_destroy (pthread_attr_t *);
int pthread_attr_setscope (pthread_attr_t *, int);
int pthread_attr_getscope (const pthread_attr_t *, int *);
int pthread_attr_setinheritsched (pthread_attr_t *, int);
int pthread_attr_getinheritsched (const pthread_attr_t *, int *);
int pthread_attr_setschedpolicy (pthread_attr_t *, int);
int pthread_attr_getschedpolicy (const pthread_attr_t *, int *);
int pthread_attr_setschedparam (pthread_attr_t *, const struct sched_param *);
int pthread_attr_getschedparam (const pthread_attr_t *, struct sched_param *);
int pthread_attr_setcontentionscope (pthread_attr_t *, int);
int pthread_attr_getcontentionscope (const pthread_attr_t *, int *);
int pthread_attr_setstacksize (pthread_attr_t *, size_t);
int pthread_attr_getstacksize (const pthread_attr_t *, size_t *);
int pthread_attr_setstackaddr (pthread_attr_t *, void *);
int pthread_attr_getstackaddr (const pthread_attr_t *, void **);
int pthread_attr_setguardsize_np (pthread_attr_t *, size_t);
int pthread_attr_getguardsize_np (const pthread_attr_t *, size_t *);




int pthread_attr_setdetachstate (pthread_attr_t *, int);
int pthread_attr_getdetachstate (const pthread_attr_t *, int *);
int pthread_attr_setprio (pthread_attr_t *, int);
int pthread_attr_getprio (const pthread_attr_t *, int *);

int pthread_attr_setname_np (pthread_attr_t *, const char *);
int pthread_attr_getname_np (const pthread_attr_t *, const char **);






int pthread_mutexattr_init (pthread_mutexattr_t *);
int pthread_mutexattr_destroy (pthread_mutexattr_t *);
int pthread_mutexattr_setpshared (pthread_mutexattr_t *, int);
int pthread_mutexattr_getpshared (const pthread_mutexattr_t *, int *);


int pthread_mutexattr_setprotocol(pthread_mutexattr_t *, int);
int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *, int *);


int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *, int);
int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *, int *);


int pthread_mutexattr_setname_np (pthread_mutexattr_t *, const char *);
int pthread_mutexattr_getname_np (const pthread_mutexattr_t *, const char **);


int pthread_mutexattr_settype_np (pthread_mutexattr_t *, int);
int pthread_mutexattr_gettype_np (const pthread_mutexattr_t *, int *);
# 266 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
int pthread_condattr_init (pthread_condattr_t *);
int pthread_condattr_destroy (pthread_condattr_t *);
int pthread_condattr_setpshared (pthread_condattr_t *, int);
int pthread_condattr_getpshared (const pthread_condattr_t *, int *);

int pthread_condattr_setname_np (pthread_condattr_t *, const char *);
int pthread_condattr_getname_np (const pthread_condattr_t *, const char **);

int pthread_condattr_setinterruptible_np (pthread_condattr_t *, int);
int pthread_condattr_getinterruptible_np (const pthread_condattr_t *, int *);





int pthread_rwlockattr_init (pthread_rwlockattr_t *);
int pthread_rwlockattr_destroy (pthread_rwlockattr_t *);
int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *, int);
int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *, int *);





typedef struct pthread_mutex {
  _pthread_waitq_t mx_waitq;
  unsigned int mx_flags;
  pthread_mutexattr_t mx_mxa;
  pthread_t mx_owner;
  struct pthread_mutex *mx_olink;
  short mx_count;
  char mx_spare[6];
} pthread_mutex_t;
# 329 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
int pthread_mutex_init (pthread_mutex_t *, const pthread_mutexattr_t *);
int pthread_mutex_destroy (pthread_mutex_t *);
int pthread_mutex_lock (pthread_mutex_t *);
int pthread_mutex_trylock (pthread_mutex_t *);
int pthread_mutex_unlock (pthread_mutex_t *);
int pthread_mutex_setprioceiling (pthread_mutex_t *, int, int *);
int pthread_mutex_getprioceiling (const pthread_mutex_t *, int *);

int pthread_mutex_setname_np (pthread_mutex_t *, const char *);
int pthread_mutex_getname_np (const pthread_mutex_t *, const char **);






typedef struct {
  _pthread_waitq_t cd_waitq;
  pthread_condattr_t cd_cda;
  char cd_spare[8];
} pthread_cond_t;



struct timespec;
int pthread_cond_init (pthread_cond_t *, const pthread_condattr_t *);
int pthread_cond_destroy (pthread_cond_t *);
int pthread_cond_wait (pthread_cond_t *, pthread_mutex_t *);
int pthread_cond_timedwait (pthread_cond_t *, pthread_mutex_t *,
       const struct timespec *);
int pthread_cond_signal (pthread_cond_t *);
int pthread_cond_broadcast (pthread_cond_t *);

int pthread_cond_setname_np (pthread_cond_t *, const char *);
int pthread_cond_getname_np (const pthread_cond_t *, const char **);






typedef struct {
    pthread_mutex_t rw_mx;
    pthread_cond_t rw_rsig;
    pthread_cond_t rw_wsig;
    pthread_rwlockattr_t rw_rwa;
    int rw_locks;
    int rw_wrwait;
    int rw_rdwait;
    pthread_t rw_owner;
} pthread_rwlock_t;
# 389 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
int pthread_rwlock_init (pthread_rwlock_t *, const pthread_rwlockattr_t *);
int pthread_rwlock_destroy (pthread_rwlock_t *);
int pthread_rwlock_rdlock (pthread_rwlock_t *);
int pthread_rwlock_wrlock (pthread_rwlock_t *);
int pthread_rwlock_tryrdlock (pthread_rwlock_t *);
int pthread_rwlock_trywrlock (pthread_rwlock_t *);
int pthread_rwlock_unlock (pthread_rwlock_t *);




int pthread_create (pthread_t *, const pthread_attr_t *,
      void * (*)(void *), void *);
void pthread_exit (void *) __attribute__ ((noreturn));
int pthread_sigmask (int, const sigset_t *, sigset_t *);
int pthread_kill (pthread_t, int);
pthread_t pthread_self (void);


int pthread_join (pthread_t, void **);
int pthread_detach (pthread_t);


int (pthread_equal) (pthread_t, pthread_t);

int pthread_getschedparam (pthread_t, int *, struct sched_param *);
int pthread_setschedparam (pthread_t, int, const struct sched_param *);

int pthread_getconcurrency_np (void);
int pthread_setconcurrency_np (int);
# 427 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
typedef struct {
    unsigned int state;
} pthread_once_t;






int _pthread_once (pthread_once_t *, void (*)(void));
int (pthread_once) (pthread_once_t *, void (*)(void));
# 446 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
int pthread_cancel (pthread_t);
void pthread_testcancel (void);


int pthread_setcancelstate (int, int *);


int pthread_setcanceltype (int, int *);


int pthread_setname_np (pthread_t, const char *);
int pthread_getname_np (pthread_t, const char **);


int pthread_getsequence_np (pthread_t, int *);
int pthread_stackused_np (pthread_t, int *);





typedef size_t pthread_key_t;
int pthread_key_create (pthread_key_t *, void (*)(void *));
int pthread_key_delete (pthread_key_t);
int pthread_setspecific (pthread_key_t, const void *);

void * (pthread_getspecific) (pthread_key_t);




struct _pthread_handler_rec {
    struct _pthread_handler_rec *next;
    void (*rtn)(void *);
    void *arg;
    int canceltype;
};

void _pthread_cleanup_push (struct _pthread_handler_rec *);
void _pthread_cleanup_pop (struct _pthread_handler_rec *);

void _pthread_cleanup_push_defer (struct _pthread_handler_rec *);
void _pthread_cleanup_pop_restore (struct _pthread_handler_rec *);
# 516 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/pthread.h" 3
typedef struct {
    int dba_evn;
    const char * dba_name;
} pthread_doorbellattr_t;

typedef struct {
  _pthread_waitq_t db_waitq;
  pthread_doorbellattr_t db_dba;
  char db_spare[8];
} pthread_doorbell_t;




int pthread_doorbellattr_init (pthread_doorbellattr_t *);
int pthread_doorbellattr_destroy (pthread_doorbellattr_t *);
int pthread_doorbellattr_setevn (pthread_doorbellattr_t *, int);
int pthread_doorbellattr_getevn (const pthread_doorbellattr_t *, int *);
int pthread_doorbellattr_setname (pthread_doorbellattr_t *, const char *);
int pthread_doorbellattr_getname (const pthread_doorbellattr_t *, const char **);

int pthread_doorbell_init (pthread_doorbell_t *,
      const pthread_doorbellattr_t *);
int pthread_doorbell_destroy (pthread_doorbell_t *);
int pthread_doorbell_wait (pthread_doorbell_t *, pthread_mutex_t *);
int pthread_doorbell_trywait (pthread_doorbell_t *);
int pthread_doorbell_timedwait (pthread_doorbell_t *, pthread_mutex_t *,
    struct timespec *);



typedef struct {
    pthread_mutex_t mx;
    pthread_t owner;
    unsigned int nlock;
    pthread_cond_t notbusy;
    char name[8];
} pthread_flock_np_t;

void pthread_flock_init_np (pthread_flock_np_t *, const char *, int, int);
int pthread_flock_lock_np (pthread_flock_np_t *);
int pthread_flock_trylock_np (pthread_flock_np_t *);
void pthread_flock_unlock_np (pthread_flock_np_t *);
void pthread_flock_cleanup_np (pthread_flock_np_t *);


typedef struct {
    sigset_t omask;
    sigset_t odefer;
    int cancel;
} pthread_sigstate_np_t;

void pthread_sigdisable_np (pthread_sigstate_np_t *);
void pthread_sigrestore_np (const pthread_sigstate_np_t *);
int pthread_sigdeferred_np (void);


long pthread_sysconf_np (int);


void * pthread_getpages_np (size_t);



int pthread_proc_create_np (int *, const pthread_attr_t *,
       int (*)(void *), void *);
# 62 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/libc_thread.h" 2 3
# 71 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/libc_thread.h" 3
extern int __isthreaded;
# 104 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/libc_thread.h" 3
struct _thread_private_key_struct {
 pthread_mutex_t mutex;
 int inited;
 void (*cleanfn)(void *);
 pthread_key_t key;
};
# 145 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/libc_thread.h" 3
void * _libc_private_storage(struct _thread_private_key_struct *,
         void *, size_t, void *);






struct _libc_data {
    struct _iob * _stdin;
    struct _iob * _stdout;
    struct _iob * _stderr;
    struct _iov * _iov;
    struct _atexit * _atexit;
    int _opterr;
    int _optind;
    int _optopt;
    int _optreset;
    char * _optarg;
    char * _optplace;
    int _tmpnamsuf;
    void * _malloc;
    void (*_cleanup) (void);
    int _exiting;
    int _ieee754csr;
    int _spare[8];
};

extern struct _libc_data * _libc_data;
# 99 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 2 3


    typedef off_t fpos_t;




    struct _iobfuncs;

    typedef struct _iob
      {
        int _io_count;
        union _iou
          {
            unsigned char *_io_ptr;
            int _io_char;
          } _io;
        unsigned char *_io_buf;
        int _io_bufsiz;
        unsigned short _io_flags;
        short _io_fd;
        void *_io_lock;
        const struct _iobfuncs *_io_funcs;
      } FILE;
# 145 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 3
    int fclose (FILE *);
    FILE *fopen (const char *, const char *);
    FILE *freopen (const char *, const char *, FILE *);
    FILE *tmpfile (void);


    int fgetc (FILE *);
    char *fgets (char *, int , FILE *);
    size_t fread (void *, size_t, size_t, FILE *);
    int fscanf (FILE *, const char *, ...);
    int getc (FILE *);
    int getchar (void);
    char *gets (char *);
    int scanf (const char *, ...);
    int sscanf (const char *, const char *, ...);
    int ungetc (int, FILE *);


    int fprintf (FILE *, const char *, ...);
    int fputc (int , FILE *);
    int fputs (const char *, FILE *);
    size_t fwrite (const void *, size_t, size_t, FILE *);
    int printf (const char *, ...);
    int putc (int, FILE *);
    int putchar (int);
    int puts (const char *);
    int sprintf (char *, const char *, ...);

    int vfprintf (FILE *, const char *, __va_list);
    int vprintf (const char *, __va_list);
    int vsprintf (char *, const char *, __va_list);

    int vscanf (const char *, __va_list);
    int vsscanf (const char *, const char *, __va_list);
    int vfscanf (FILE *, const char *, __va_list);


    int snprintf (char *, size_t, const char *, ...);
    int vsnprintf (char *, size_t, const char *, __va_list);
    int asprintf (char **, const char *, ...);
    int vasprintf (char **, const char *, __va_list);





    int _ifprintf (FILE *, const char *, ...);
    int _iprintf (const char *, ...);
    int _isprintf (char *, const char *, ...);
    int _ivfprintf (FILE *, const char *, __va_list);
    int _ivprintf (const char *, __va_list);
    int _ivsprintf (char *, const char *, __va_list);

    int _iscanf (const char *, ...);
    int _ifscanf (FILE *, const char *, ...);
    int _isscanf (const char *, const char *, ...);
    int _ivscanf (const char *, __va_list);
    int _ivsscanf (const char *, const char *, __va_list);
    int _ivfscanf (FILE *, const char *, __va_list);


    int _isnprintf (char *, size_t, const char *, ...);
    int _ivsnprintf (char *, size_t, const char *, __va_list);
    int _iasprintf (char **, const char *, ...);
    int _ivasprintf (char **, const char *, __va_list);
# 235 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 3
extern int _mon_getc (int canblock);
extern void _mon_putc (char c);
extern void _mon_puts (const char * s);
extern void _mon_write (const char * s, unsigned int count);





    void clearerr (FILE *);
    int feof (FILE *);
    int ferror (FILE *);
    int fflush (FILE *);
    int fgetpos (FILE *, fpos_t *);
    int fseek (FILE *, long int, int);
    int fsetpos (FILE *, const fpos_t *);
    long int ftell (FILE *);
    void rewind (FILE *);
    void setbuf (FILE *, char *);
    int setvbuf (FILE *, char *, int, size_t);


    int remove (const char *);
    int rename (const char *, const char *);


    char *tmpnam (char *s);
    void perror (const char *s);

    extern int sys_nerr;
    extern const char * const sys_errlist[];
# 274 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 3
    extern int _fwalk (int (*) (FILE *));
# 286 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdio.h" 3
    void clearerr(FILE *);
# 40 "wiring_private.h" 2
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdarg.h" 1 3
# 122 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdarg.h" 3
typedef __va_list va_list;
# 41 "wiring_private.h" 2




# 1 "wiring.h" 1





# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/inttypes.h" 1 3
# 46 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/inttypes.h" 3
# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/include/stdint.h" 1 3 4


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdint.h" 1 3 4
# 85 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdint.h" 3 4
typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;



# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_mwgwtypes.h" 1 3 4
# 48 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_mwgwtypes.h" 3 4
__extension__
typedef signed char int_least8_t;
typedef unsigned char uint_least8_t;
typedef short int int_least16_t;
typedef unsigned short int uint_least16_t;
typedef int int_least32_t;
typedef unsigned int uint_least32_t;
# 63 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_mwgwtypes.h" 3 4
__extension__
typedef long long int int_least64_t;

__extension__
typedef unsigned long long int uint_least64_t;



typedef int int_fast8_t;
typedef unsigned int uint_fast8_t;
typedef int int_fast16_t;
typedef unsigned int uint_fast16_t;
typedef int int_fast32_t;
typedef unsigned int uint_fast32_t;
# 85 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_mwgwtypes.h" 3 4
__extension__
typedef long long int int_fast64_t;

__extension__
typedef unsigned long long int uint_fast64_t;
# 102 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_mwgwtypes.h" 3 4
__extension__
typedef long long int intmax_t;

__extension__
typedef unsigned long long int uintmax_t;
# 95 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdint.h" 2 3 4


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_limits.h" 1 3 4
# 98 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdint.h" 2 3 4



# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_const.h" 1 3 4
# 102 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/stdint.h" 2 3 4
# 4 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/include/stdint.h" 2 3 4
# 47 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/inttypes.h" 2 3


# 1 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/machine/int_fmtio.h" 1 3
# 50 "/opt/local/pic32/install-image/bin/../lib/gcc/pic32mx/4.5.1/../../../../pic32mx/include/inttypes.h" 2 3
# 7 "wiring.h" 2
# 1 "binary.h" 1
# 8 "wiring.h" 2
# 71 "wiring.h"
typedef unsigned int word;



typedef __uint8_t boolean;
typedef __uint8_t byte;

void init(void);

void pinMode(__uint8_t, __uint8_t);
void digitalWrite(__uint8_t, __uint8_t);
int digitalRead(__uint8_t);
int analogRead(__uint8_t);
void analogReference(__uint8_t mode);
void analogWrite(__uint8_t, int);

void beginSerial(long);
void serialWrite(unsigned char);
int serialAvailable(void);
int serialRead(void);
void serialFlush(void);

unsigned long millis(void);
unsigned long micros(void);
void delay(unsigned long);
void delayMicroseconds(unsigned int us);
unsigned long pulseIn(__uint8_t pin, __uint8_t state, unsigned long timeout);

void shiftOut(__uint8_t dataPin, __uint8_t clockPin, __uint8_t bitOrder, byte val);

void attachInterrupt(__uint8_t, void (*)(void), int mode);
void detachInterrupt(__uint8_t);

void setup(void);
void loop(void);






extern unsigned int __PIC32_pbClk;
# 46 "wiring_private.h" 2
# 77 "wiring_private.h"
 void turnOffPWM(__uint8_t timer);

 typedef void (*voidFuncPtr)(void);
# 36 "wiring.c" 2



#pragma config POSCMOD=XT, FNOSC=PRIPLL
#pragma config FPLLIDIV=DIV_2, FPLLMUL=MUL_20, FPLLODIV=DIV_1
#pragma config FPBDIV=DIV_2, FWDTEN=OFF, CP=OFF, BWP=OFF





unsigned int __PIC32_pbClk;
# 65 "wiring.c"
volatile unsigned long timer0_millis = 0;



unsigned long millis()
{
 return(timer0_millis);
}


unsigned long micros()
{

 return(timer0_millis);
}







void delay(unsigned long ms)
{
unsigned long startMillis;

 startMillis = timer0_millis;
 while ((timer0_millis - startMillis) < ms)
 {

 }
}



void delayMicroseconds(unsigned int us)
{
 delay(1);
# 118 "wiring.c"
}
# 129 "wiring.c"
void init()
{






 __PIC32_pbClk = SYSTEMConfig(80000000L, 0x00000001 | 0x00000004);





 OpenCoreTimer((80000000L / 2 / 1000));


 ((IFS0CLR = 0x00000001), (IPC0CLR = 0x0000001C, IPC0SET = ((((((1 << 15) | (2) | (0 << 4))) & 7)) << 0x00000002)), (IPC0CLR = 0x00000003, IPC0SET = (((((((1 << 15) | (2) | (0 << 4))) >> 4) & 3)) << 0x00000000)), (IEC0CLR = 0x00000001, IEC0SET = ((((((1 << 15) | (2) | (0 << 4))) >> 15)) << 0x00000000)));


 INTEnableSystemMultiVectoredInt();



 RtccInit();



 delay(50);

 RtccOpen(0x10073000, 0x10101701, 0);
 RtccSetTimeDate(0x10073000, 0x10101701);


}



void __attribute__((vector(0), interrupt(ipl2), nomips16)) CoreTimerHandler(void)
{

 (IFS0CLR = 0x00000001);




 UpdateCoreTimer((80000000L / 2 / 1000));

 timer0_millis++;
}
