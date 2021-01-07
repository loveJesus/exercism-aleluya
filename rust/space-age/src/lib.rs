// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.
const SECONDS_PER_YEAR_ALELUYA: f64 = 60.0 * 60.0 * 24.0 * 365.25;
#[derive(Debug)]
pub struct Duration {
    pub seconds_aleluya: f64,
}

impl From<u64> for Duration {
    fn from(s_aleluya: u64) -> Self {
        Duration {
            seconds_aleluya: s_aleluya as f64,
        }
    }
}

pub trait PlanetAleluya {
    const E_RATIO_ALELUYA: f64;
    fn years_during(d_aleluya: &Duration) -> f64 {
        (d_aleluya.seconds_aleluya / Self::E_RATIO_ALELUYA) / SECONDS_PER_YEAR_ALELUYA
    }
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl PlanetAleluya for Mercury {
    const E_RATIO_ALELUYA: f64 = 0.2408467;
}
impl PlanetAleluya for Venus {
    const E_RATIO_ALELUYA: f64 = 0.61519726;
}
impl PlanetAleluya for Earth {
    const E_RATIO_ALELUYA: f64 = 1.0;
}
impl PlanetAleluya for Mars {
    const E_RATIO_ALELUYA: f64 = 1.8808158;
}
impl PlanetAleluya for Jupiter {
    const E_RATIO_ALELUYA: f64 = 11.862615;
}
impl PlanetAleluya for Saturn {
    const E_RATIO_ALELUYA: f64 = 29.447498;
}
impl PlanetAleluya for Uranus {
    const E_RATIO_ALELUYA: f64 = 84.016846;
}
impl PlanetAleluya for Neptune {
    const E_RATIO_ALELUYA: f64 = 164.79132;
}
