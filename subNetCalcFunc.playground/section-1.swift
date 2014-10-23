func mapOctects(ipAddress: String, convert: String -> String?) -> String? {
    let sep = Character(".")
    let octets = split(ipAddress) {$0 == sep}.map {convert($0)}
    if octets.filter({$0 == nil}).count == 0 {
        return join(String(sep), octets.map {$0!})
    } else {
        return nil
    }
}

extension String {
    func toBin() -> String? {
        if let n = self.toInt() {
            let oct = String(n, radix:2)
            let zeros = String(
                count:8 - countElements(oct),
                repeatedValue:Character("0"))
            return zeros + oct
        } else {
            return nil
        }
    }
}

println(mapOctects("10.10.83.51") {$0.toBin()} ?? "invalid input")
//println(mapOctects("one, two, three") ?? "invalid input")